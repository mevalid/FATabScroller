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
import FATabScroller
import Font_Awesome_Swift

class ViewController: UIViewController, FATabPanelDelegate {
    
    let tabPanel: FATabPanel = FATabPanel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegation
        tabPanel.shared = self
        
        view.addSubview(tabPanel)
        
        tabPanelConfig()
        layout()
    }
    
    func layout() {
        tabPanel.constraintsStretch()
    }
    
    func tabPanelConfig() {
        var tabPanelItems = [FATabPanelItem]()
        let icons: [FAType] = [.FAHome, .FATv, .FABandcamp, .FAAreaChart, .FABell, .FABook, .FALifeRing, .FAVideoCamera, .FAExchange, .FAHeart, .FAMap, .FAPodcast, .FACloud, .FADiamond]
        
        for i in icons {
            let view = UIView()
            let title = UILabel()
            let underline = UIView()
            
            underline.backgroundColor = randomColor()
            title.textColor = .black
            title.translatesAutoresizingMaskIntoConstraints = false
            title.text = "Panel - \(i)"
            view.addSubview(title)
            view.addSubview(underline)
            
            title.constraintWithAttribute(to: view, attribute: .centerX)
            title.constraintWithAttribute(to: view, attribute: .centerY)
            
            underline.addSCConstraints { sc in
                sc.constraintWithAttribute(to: title, attribute: .width, 20)
                sc.constraintHeightConstant(c: 25)
                sc.constraintWithAttribute(to: title, attribute: .topFromBottom, 5)
                sc.constraintWithAttribute(to: title, attribute: .centerX)
            }
            
            tabPanelItems.append(
                FATabPanelItem(title: i, card: view)
            )
        }
        
        tabPanel.items = tabPanelItems
        tabPanel.tabBarBackgroundColor = UIColor.orange
        tabPanel.tabBarColor = UIColor.white
    }
    
    private func randomColor() -> UIColor {
        return UIColor(
            red: CGFloat(arc4random()) / CGFloat(UInt32.max),
            green: CGFloat(arc4random()) / CGFloat(UInt32.max),
            blue: CGFloat(arc4random()) / CGFloat(UInt32.max),
            alpha: 1.0
        )
    }
    
    // MARK: FATabPanelDelegate
    func beforeTabChange() -> Bool {
        print("beforetabchange event")
        return true
    }
    
    func tabChange() {
        print("ontabchange event")
    }
}

