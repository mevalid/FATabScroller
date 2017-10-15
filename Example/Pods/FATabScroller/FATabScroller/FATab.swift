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
import Font_Awesome_Swift

class FATab: FALabel, UIGestureRecognizerDelegate {
    
    private var originTextColor: UIColor?
    
    var gesture: UITapGestureRecognizer!
    var index: Int?
    
    /**
     * Property
     * Indicates that this tab is currently active.
     */
    var active: Bool = false
    
    var tabIcon: FAType? {
        didSet {
            guard let _ = tabIcon else {
                self.FAIcon = nil
                return
            }
            
            self.setFAIcon(icon: tabIcon!, iconSize: self.font.pointSize)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = true
        
        self.originTextColor = self.textColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let originAlpha = self.alpha
        self.alpha = 0.5
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = originAlpha
        })
        
        return true
    }
    
    // Add tap action.
    func addTarget(target: AnyObject?, action: Selector) {
        gesture = UITapGestureRecognizer(target: target, action: action)
        gesture.delegate = self
        addGestureRecognizer(gesture)
    }
    
    func enable() {
        self.isUserInteractionEnabled = true
        self.textColor = self.originTextColor
    }
    
    func disable() {
        self.isUserInteractionEnabled = false
        self.textColor = UIColor.gray
    }
}
