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

public class FATabBar: UIView {
    
    var items = [FATab]()
    
    var tabBarBackgroundColor: UIColor? {
        didSet {
            self.scrollView.backgroundColor = UIColor(color: tabBarBackgroundColor!, brightnessBy: 20)
            self.activeHolder.backgroundColor = tabBarBackgroundColor
        }
    }
    
    //Fired when the tab is activated.
    var activeTab: Int = 0 {
        didSet {
            activateTab()
        }
    }
    
    private var scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.showsHorizontalScrollIndicator = false
        return v
    }()
    
    private var contentView: UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .horizontal
        v.distribution = .fillEqually
        return v
    }()
    
    private let activeHolder: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 3
        return v
    }()
    
    private let activeHolderLabel: FALabel = {
        let v = FALabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.backgroundColor = UIColor.clear
        v.textColor = UIColor.white
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.labelSettings(label: activeHolderLabel)
        
        // Orientation change.
        NotificationCenter.default.addObserver(self, selector: #selector(self.viewWillTransition), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        scrollView.addSubview(contentView)
        self.addSubview(scrollView)
        
        activeHolder.addSubview(activeHolderLabel)
        self.addSubview(activeHolder)
        
        layout()
    }
    
    required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Set stack's width constraints with left margin
        contentView.scLayout(.stretchWidth(activeHolder.frame.maxX + 5, 0))
        
        // Set holder's shadow
        holderDropShadow()
    }
    
    func viewWillTransition() {
        
        // Change labels insets due to device orientation to properly fill the icons.
        switch UIDevice.current.orientation{
        case .portrait, .portraitUpsideDown:
            activeHolderLabel.textInsets = UIEdgeInsets(top: 3, left: 8, bottom: 3, right: 8)
            contentView.spacing = 2
            let _ = items.map {
                $0.textInsets = UIEdgeInsets(top: 7, left: 12, bottom: 7, right: 12)
            }
            
        case .landscapeLeft, .landscapeRight:
            activeHolderLabel.textInsets = UIEdgeInsets(top: 1, left: 4, bottom: 1, right: 4)
            contentView.spacing = 6
            let _ = items.map {
                $0.textInsets = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 5)
            }
        default:
            break
        }
        
        // Remove stack's width constraints
        // We will set it again on redraw
        scrollView.removeConstraints(contentView.widthStretchConstraints!)
        
        // Redraws rectangle bounds on orientation change.
        self.setNeedsDisplay()
    }
    
    // Layout configuration.
    private func layout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.clear
        
        scrollView.scLayout( .stretch(5, 0, 0, 0) )
        
        contentView.scLayout([
            .centerY(to: scrollView),
            .stretchWidth(),
            .stretchHeight()
        ])
        
        activeHolder.scLayout([
            .width(to: activeHolderLabel),
            .left(to: self, 1, 10),
            .stretchHeight()
        ])
        
        activeHolderLabel.scLayout([
            .stretchHeight(),
            .widthFromHeight(to: self, 0.85),
            .centerX(to: activeHolder)
        ])
    }
    
    private func activateTab() {
        
        UIView.animate(withDuration: 0.2, animations: {
            self.activeHolderLabel.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            self.layoutIfNeeded()
        }, completion: { _ in
            
            if let icon = self.items[self.activeTab].tabIcon {
                let fontSize = self.activeHolderLabel.font.pointSize
                self.activeHolderLabel.setFAIcon(icon: icon, iconSize: fontSize)
            }
            else {
                self.activeHolderLabel.FAIcon = nil
            }
            
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10, options: .curveLinear, animations: {
                self.activeHolderLabel.transform = CGAffineTransform.identity
            }, completion: { _ in })
        })
    }
    
    private func holderDropShadow() {
        let layer = activeHolder.layer
        layer.masksToBounds = false
        
        layer.shadowOffset = CGSize(width: 1, height: 0)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.4
        layer.shadowPath = UIBezierPath(rect: layer.bounds).cgPath
    }
    
    // Set high font size to allow adjustment by the size of the label.
    private func labelSettings(label: FALabel) {
        label.font = UIFont(name: label.font.fontName, size: 60)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.baselineAdjustment = .alignCenters
    }
    
    func addTab(tab: FATab) {
        self.labelSettings(label: tab)
        contentView.addArrangedSubview(tab)
        
        // Layout
        tab.scLayout([
            .stretchHeight(),
            .widthFromHeight(to: self, 0.85)
        ])
        
        // Append tab
        items.append(tab)
    }
}
