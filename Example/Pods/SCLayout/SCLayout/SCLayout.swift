// MIT License
//
// Copyright (c) 2017 mevalid
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.


import UIKit

/**
    Set of named layout attributes.

    - center: First elemenet x,y-axis center point equal to the center along the x,y-axis of the second element.
    - centerX: First elemenet x-axis center point equal to the center along the x-axis of the second element.
    - centerY: First elemenet y-axis center point equal to the center along the y-axis of the second element.
    - top: First element top value equal to the top of the second element.
    - bottom: First element bottom value equal to the bottom of the second element.
    - left: First element left value equal to the left of the second element.
    - right: First element right value equal to the right of the second element.
    - height: First element height value equal to the height of the second element.
    - width: First element width value equal to the width of the second element.
    - leftFromCenterX: First element left value equal to the x-axis center point of the second element.
    - rightFromCenterX: First element right value equal to the x-axis center point of the second element.
    - bottomFromCenterY: First element bottom value equal to the y-axis center point of the second element.
    - topFromCenterY: First element top value equal to the y-axis center point of the second element.
    - bottomFromTop: First element bottom value equal to the top of the second element.
    - topFromBottom: First element top value equal to the bottom of the second element.
    - leftFromRight: First element left value equal to the right of the second element.
    - rightFromLeft: First element right value equal to the left of the second element.
    - widthFromHeight: First element width value equal to the height of the second element.
    - heightFromWidth: First element height value equal to the width of the second element.
 */
public enum SCAttribute {
    case center
    case centerX
    case centerY
    case top
    case bottom
    case left
    case right
    case height
    case width
    case leftFromCenterX
    case rightFromCenterX
    case bottomFromCenterY
    case topFromCenterY
    case bottomFromTop
    case topFromBottom
    case leftFromRight
    case rightFromLeft
    case widthFromHeight
    case heightFromWidth
    
}

public extension UIView {
    
    /**
        Variables as view's constraint anchors.
     
        - widthConstraint: Width constraint.
        - heightConstraint: Height constraint.
        - centerXConstraint: Center along the x-axis constraint.
        - centerYConstraint: Center along the y-axis constraint.
        - topConstraint: Top constraint.
        - bottomConstraint: Bottom constraint.
        - leftConstraint: Left constraint.
        - rightConstraint: Right constraint.
        - horizontalFormatConstraints: Horizontal constraints from visual format string.
        - verticalFormatConstraints: Vertical constraints from visual format string.
        - widthStretchConstraints: Width constraints from visual format string.
        - heightStretchConstraints: Height constraints from visual format string.
     */
    fileprivate struct AssociatedKeys {
        
        static var widthConstraint: NSLayoutConstraint?
        static var heightConstraint: NSLayoutConstraint?
        static var centerXConstraint: NSLayoutConstraint?
        static var centerYConstraint: NSLayoutConstraint?
        static var topConstraint: NSLayoutConstraint?
        static var bottomConstraint: NSLayoutConstraint?
        static var leftConstraint: NSLayoutConstraint?
        static var rightConstraint: NSLayoutConstraint?
        static var horizontalFormatConstraints: [NSLayoutConstraint]?
        static var verticalFormatConstraints: [NSLayoutConstraint]?
        static var widthStretchConstraints: [NSLayoutConstraint]?
        static var heightStretchConstraints: [NSLayoutConstraint]?
    }
    
    
    var widthConstraint: NSLayoutConstraint? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.widthConstraint) as? NSLayoutConstraint
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.widthConstraint, newValue as NSLayoutConstraint?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    var heightConstraint: NSLayoutConstraint? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.heightConstraint) as? NSLayoutConstraint
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.heightConstraint, newValue as NSLayoutConstraint?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    var centerXConstraint: NSLayoutConstraint? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.centerXConstraint) as? NSLayoutConstraint
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.centerXConstraint, newValue as NSLayoutConstraint?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    var centerYConstraint: NSLayoutConstraint? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.centerYConstraint) as? NSLayoutConstraint
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.centerYConstraint, newValue as NSLayoutConstraint?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    var topConstraint: NSLayoutConstraint? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.topConstraint) as? NSLayoutConstraint
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.topConstraint, newValue as NSLayoutConstraint?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    var bottomConstraint: NSLayoutConstraint? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.bottomConstraint) as? NSLayoutConstraint
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.bottomConstraint, newValue as NSLayoutConstraint?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    var leftConstraint: NSLayoutConstraint? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.leftConstraint) as? NSLayoutConstraint
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.leftConstraint, newValue as NSLayoutConstraint?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    var rightConstraint: NSLayoutConstraint? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.rightConstraint) as? NSLayoutConstraint
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.rightConstraint, newValue as NSLayoutConstraint?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    var horizontalFormatConstraints: [NSLayoutConstraint]? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.horizontalFormatConstraints) as? [NSLayoutConstraint]
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.horizontalFormatConstraints, newValue as [NSLayoutConstraint]?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    var verticalFormatConstraints: [NSLayoutConstraint]? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.verticalFormatConstraints) as? [NSLayoutConstraint]
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.verticalFormatConstraints, newValue as [NSLayoutConstraint]?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    var widthStretchConstraints: [NSLayoutConstraint]? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.widthStretchConstraints) as? [NSLayoutConstraint]
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.widthStretchConstraints, newValue as [NSLayoutConstraint]?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    var heightStretchConstraints: [NSLayoutConstraint]? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.heightStretchConstraints) as? [NSLayoutConstraint]
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.heightStretchConstraints, newValue as [NSLayoutConstraint]?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    /// Self-contained block that will disable iOS creation of Auto Layout constraints before adding our own constraints to the view.
    func addSCConstraints(_ completion: (_ sc: UIView) -> Void) {
        self.translatesAutoresizingMaskIntoConstraints = false
        completion(self)
    }
    
    /// Vertical or horizontal constraints using the visual format
    func constraintFormat(format: String, _ views: [String : AnyObject], _ metrics: [String : AnyObject]? = nil) {
        if format.contains("H:") {
            self.horizontalFormatConstraints = NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: metrics, views: views)
            NSLayoutConstraint.activate(self.horizontalFormatConstraints!)
        }
        else {
            self.verticalFormatConstraints = NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: metrics, views: views)
            NSLayoutConstraint.activate(self.verticalFormatConstraints!)
        }
    }
    
    /// Horizontal connection to the parent view using the visual format with the spacing between their left/right leading edges
    func constraintsStretchWidth(_ left: CGFloat = 0, _ right: CGFloat = 0) {
        self.widthStretchConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(left)-[view]-(right)-|", options: [], metrics: ["left": left, "right": right], views: ["view": self])
        NSLayoutConstraint.activate(self.widthStretchConstraints!)
    }
    
    /// Vertical connection to the parent view using the visual format with the spacing between their top/bottom leading edges
    func constraintsStretchHeight(_ top: CGFloat = 0, _ bottom: CGFloat = 0) {
        self.heightStretchConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(top)-[view]-(bottom)-|", options: [], metrics: ["top": top, "bottom": bottom], views: ["view": self])
        NSLayoutConstraint.activate(self.heightStretchConstraints!)
    }
    
    /// Vertical & horizontal connection to the parent view using the visual format with the spacing between their left/top/right/bottom leading edges
    func constraintsStretch(_ left: CGFloat = 0, _ top: CGFloat = 0, _ right: CGFloat = 0, _ bottom: CGFloat = 0) {
        self.widthStretchConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(left)-[view]-(right)-|", options: [], metrics: ["left": left, "right": right], views: ["view": self])
        NSLayoutConstraint.activate(self.widthStretchConstraints!)
        
        self.heightStretchConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(top)-[view]-(bottom)-|", options: [], metrics: ["top": top, "bottom": bottom], views: ["view": self])
        NSLayoutConstraint.activate(self.heightStretchConstraints!)
    }
    
    /// Layout anchor constraint that defines the anchor’s width attribute with relations of 'equal', 'greater than or equal', 'less than or equal' to a constant
    func constraintWidthConstant(c: CGFloat, _ relation: NSLayoutRelation? = .equal) {
        
        switch relation! {
        case .equal:
            self.widthConstraint = self.widthAnchor.constraint(equalToConstant: c)
        case .greaterThanOrEqual:
            self.widthConstraint = self.widthAnchor.constraint(greaterThanOrEqualToConstant: c)
        case .lessThanOrEqual:
            self.widthConstraint = self.widthAnchor.constraint(lessThanOrEqualToConstant: c)
        }
        
        self.widthConstraint!.isActive = true
    }
    
    /// Layout anchor constraint that defines the anchor’s height attribute with relations of 'equal', 'greater than or equal', 'less than or equal' to a constant
    func constraintHeightConstant(c: CGFloat, _ relation: NSLayoutRelation? = .equal) {
        
        switch relation! {
        case .equal:
            self.heightConstraint = self.heightAnchor.constraint(equalToConstant: c)
        case .greaterThanOrEqual:
            self.heightConstraint = self.heightAnchor.constraint(greaterThanOrEqualToConstant: c)
        case .lessThanOrEqual:
            self.heightConstraint = self.heightAnchor.constraint(lessThanOrEqualToConstant: c)
        }
        
        self.heightConstraint!.isActive = true
    }
    
    /**
        Constraint that defines the relationship between the specified attributes of the given views.
     
        - Parameters:
        - to: Second view of relation.
        - attribute: Relation value of layout attribute.
        - constant: The value of the constraint.
        - multiplier: The multiplier applied to the second attribute participating in the constraint.
     */
    func constraintWithAttribute(to: Any, attribute: SCAttribute, _ constant: CGFloat = 0, _ multiplier: CGFloat = 1) {
        
        switch attribute {
            
        case .center:
            self.centerXConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: to, attribute: .centerX, multiplier: multiplier, constant: constant)
            self.centerYConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: to, attribute: .centerY, multiplier: multiplier, constant: constant)
            NSLayoutConstraint.activate([self.centerXConstraint!, self.centerYConstraint!])
            
        case .centerX:
            self.centerXConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: to, attribute: .centerX, multiplier: multiplier, constant: constant)
            NSLayoutConstraint.activate([self.centerXConstraint!])
            
        case .centerY:
            self.centerYConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: to, attribute: .centerY, multiplier: multiplier, constant: constant)
            NSLayoutConstraint.activate([self.centerYConstraint!])
            
        case .top:
            self.topConstraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: to, attribute: .top, multiplier: multiplier, constant: constant)
            NSLayoutConstraint.activate([self.topConstraint!])
            
        case .bottom:
            self.bottomConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: to, attribute: .bottom, multiplier: multiplier, constant: constant)
            NSLayoutConstraint.activate([self.bottomConstraint!])
            
        case .left:
            self.leftConstraint = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: to, attribute: .left, multiplier: multiplier, constant: constant)
            NSLayoutConstraint.activate([self.leftConstraint!])
            
        case .right:
            self.rightConstraint = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: to, attribute: .right, multiplier: multiplier, constant: constant)
            NSLayoutConstraint.activate([self.rightConstraint!])
            
        case .height:
            self.heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: to, attribute: .height, multiplier: multiplier, constant: constant)
            NSLayoutConstraint.activate([self.heightConstraint!])
            
        case .width:
            self.widthConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: to, attribute: .width, multiplier: multiplier, constant: constant)
            NSLayoutConstraint.activate([self.widthConstraint!])
            
        case .bottomFromCenterY:
            self.bottomConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: to, attribute: .centerY, multiplier: multiplier, constant: constant)
            NSLayoutConstraint.activate([self.bottomConstraint!])
            
        case .topFromCenterY:
            self.topConstraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: to, attribute: .centerY, multiplier: multiplier, constant: constant)
            NSLayoutConstraint.activate([self.topConstraint!])
            
        case .leftFromCenterX:
            self.leftConstraint = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: to, attribute: .centerX, multiplier: multiplier, constant: constant)
            NSLayoutConstraint.activate([self.leftConstraint!])
            
        case .rightFromCenterX:
            self.rightConstraint = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: to, attribute: .centerX, multiplier: multiplier, constant: constant)
            NSLayoutConstraint.activate([self.rightConstraint!])
            
        case .bottomFromTop:
            self.bottomConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: to, attribute: .top, multiplier: multiplier, constant: constant)
            NSLayoutConstraint.activate([self.bottomConstraint!])
            
        case .topFromBottom:
            self.topConstraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: to, attribute: .bottom, multiplier: multiplier, constant: constant)
            NSLayoutConstraint.activate([self.topConstraint!])
            
        case .leftFromRight:
            self.leftConstraint = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: to, attribute: .right, multiplier: multiplier, constant: constant)
            NSLayoutConstraint.activate([self.leftConstraint!])
            
        case .rightFromLeft:
            self.rightConstraint = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: to, attribute: .left, multiplier: multiplier, constant: constant)
            NSLayoutConstraint.activate([self.rightConstraint!])
            
        case .widthFromHeight:
            self.widthConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: to, attribute: .height, multiplier: multiplier, constant: constant)
            NSLayoutConstraint.activate([self.widthConstraint!])
            
        case .heightFromWidth:
            self.heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: to, attribute: .width, multiplier: multiplier, constant: constant)
            NSLayoutConstraint.activate([self.heightConstraint!])
        }
    }
}
