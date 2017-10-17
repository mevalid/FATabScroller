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
import SCLayout

public struct FATabPanelItem {
    var title: FAType
    var card: UIView
    
    public init(title: FAType, card: UIView) {
        self.title = title
        self.card = card
    }
}

public protocol FATabPanelDelegate {
    /**
     * Event
     * Fires before a tab change. Return false to cancel the tabchange.
     */
    func beforeTabChange() -> Bool
    
    /**
     * Event
     * Fires when a new tab has been activated.
     */
    func tabChange()
}

public class FATabPanel: UIView, FATabCardLayoutProtocol {
    
    public var shared: FATabPanelDelegate?
    
    public var items: [FATabPanelItem]? {
        didSet {
            setTabBar()
        }
    }
    
    public var cardLayout: FATabCardLayout = FATabCardLayout()
    
    public var tabBar: FATabBar = {
        let v = FATabBar()
        return v
    }()
    
    public var tabBarBackgroundColor: UIColor? {
        didSet {
            self.tabBar.tabBarBackgroundColor = tabBarBackgroundColor
        }
    }
    
    public var tabBarColor: UIColor? {
        didSet {
            for item in tabBar.items {
                item.textColor = tabBarColor
            }
        }
    }
    
    public var activeTab: Int = 0 {
        didSet {
            tabBar.activeTab = activeTab
            cardLayout.active = activeTab
        }
    }
    
    public var animate: Bool = false {
        didSet {
            cardLayout.animate = animate
        }
    }
    
    private var container: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Collection delegate.
        cardLayout.shared = self
        
        addSubview(cardLayout)
        addSubview(tabBar)
        
        tabBar.activeTab = activeTab
        
        layout()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Layout configuration.
    private func layout() {
        
        self.constraintFormat(format: "V:|[collection]-(-5)-[tabBar]|", [
            "collection": cardLayout,
            "tabBar": tabBar
            ])
        
        cardLayout.constraintsStretchWidth()
        
        tabBar.constraintsStretchWidth()
        tabBar.constraintWithAttribute(to: self, attribute: .height, 1, 0.08)
    }
    
    // FATabBar config.
    private func setTabBar() {
        
        for (i, item) in items!.enumerated() {
            let tab = FATab()
            tab.index = i
            tab.tabIcon = item.title
            tab.addTarget(target: self, action: #selector(self.setActiveTab(gesture:)))
            tab.textColor = tabBarColor
            tabBar.addTab(tab: tab)
            cardLayout.add(item: item.card)
        }
    }
    
    // Makes the given card active. Makes it the visible card
    // in the FATabCardLayout and fills FATabBar active label with active icon.
    func setActiveTab(gesture: UITapGestureRecognizer) {
        
        if let tab = gesture.view as? FATab {
            
            guard (shared?.beforeTabChange())! else {
                return
            }
            
            activeTab = tab.index!
            shared?.tabChange()
        }
    }
    
    // MARK: FATabCardLayoutProtocol
    public func cardChange(index: Int) {
        activeTab = index
    }
}
