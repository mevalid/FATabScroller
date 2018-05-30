// MIT License

// Copyright (c) 2017 mevalid

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit
import SCLayout

public protocol FATabCardLayoutProtocol: class {
    func cardChange(index: Int)
}

public class FATabCardLayout: UIScrollView, UIScrollViewDelegate {
    
    weak var shared: FATabCardLayoutProtocol?
    
    var active: Int = 0 {
        didSet {
            //Fired when the card is activated.
            onActivate()
        }
    }
    
    /**
     * Property
     * Indicates that card scrolling is enabled/disabled.
     */
    var animate: Bool = false {
        didSet {
            self.isScrollEnabled = animate
        }
    }
    
    var count: Int {
        return stack.subviews.count
    }
    
    private var cardWidth: CGFloat = 0
    
    private let stack: UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .horizontal
        v.distribution = .fillEqually
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        // Orientation change.
        NotificationCenter.default.addObserver(self, selector: #selector(self.viewWillTransition), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        self.delegate = self
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.isPagingEnabled = false
        self.isScrollEnabled = animate
        
        addSubview(stack)
        
        layout()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        self.cardWidth = self.frame.width
        contentOffset = CGPoint(x: cardWidth * CGFloat(active), y: 0)
    }
    
    // Redraws rectangle bounds on orientation change.
    func viewWillTransition() {
        self.setNeedsDisplay()
    }
    
    // Layout configuration.
    private func layout() {
        stack.scLayout( .stretch() )
    }
    
    // Add card at 'index'.
    func add(item: UIView, at: Int? = nil) {
        stack.insertArrangedSubview(item, at: at ?? stack.subviews.count)
        
        // Layout
        item.scLayout([
            .width(to: self),
            .height(to: self)
        ])
        
        reload()
    }
    
    // Returns card by 'index'.
    func get(index: Int) -> UIView? {
        return self.stack.subviews[index]
    }
    
    func reload() {
        contentSize = stack.frame.size
    }
    
    private func onActivate() {
        guard cardWidth > 0 else { return }
        
        if animate {
            UIView.animate(withDuration: 0.3, animations: {
                self.scrollToActiveCard()
            })
        }
        else {
            /// fade effect
            UIView.animate(withDuration: 0.2, animations: {
                let lastIndex = self.contentOffset.x / self.cardWidth
                let lastCard = self.get(index: Int(lastIndex))
                lastCard?.alpha = 0
            }, completion: { _ in
                
                let card = self.get(index: self.active)
                card?.alpha = 0
                self.scrollToActiveCard()
                UIView.animate(withDuration: 0.2, animations: {
                    card?.alpha = 1
                })
            })
        }
    }
    
    private func scrollToActiveCard() {
        self.contentOffset = CGPoint(x: self.cardWidth * CGFloat(self.active), y: 0)
    }
    
    // MARK: UIScrollViewDelegate
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        active = Int((floor(contentOffset.x - cardWidth / 2) / cardWidth) + 1)
    }
    
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        var newCard: Int = active
        
        if (velocity.x == 0) {
            newCard = Int(floor((targetContentOffset.pointee.x - cardWidth / 2) / cardWidth) + 1)
        }
        else {
            newCard = velocity.x > 0 ? active + 1 : active - 1;
            
            if (newCard < 0) {
                newCard = 0
            }
            
            let pageWidth = contentSize.width / cardWidth
            if (CGFloat(newCard) > pageWidth) {
                newCard = Int(ceil(pageWidth) - 1)
            }
        }
        
        targetContentOffset.pointee.x = CGFloat(newCard) * cardWidth
        active = newCard
        
        if newCard < stack.subviews.count {
            shared?.cardChange(index: active)
        }
    }
}
