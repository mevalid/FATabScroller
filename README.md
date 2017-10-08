# FATabScroller
The FATabScroller is a completely customizable widget with set of layered pages where only one page is displayed at a time.

<br><br>
<p align="center">
  <img src="https://github.com/mevalid/FATabScroller/blob/master/example.gif">
</p>

## Requirements

- Xcode 8.0+
- Swift 3.0+

## Installation

FATabScroller is available through CocoaPods. You can install it with the following command:

```bash
$ gem install cocoapods
```

```ruby
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'FATabScroller', '~> 1.0.0'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage

### Properties

- `tabBarBackgroundColor {UIColor}` - Background color of the tabbar.
- `tabBarColor {UIColor}` - The color of the bar icon.
- `animate {Bool}` - Indicates that card scrolling is enabled/disabled.

### Events
- `beforeTabChange` - Fires before a tab change. Return false to cancel the tabchange.
- `tabChange` - Fires when a new tab has been activated.

## Example

```swift
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
```

## License

FATabScroller is released under the MIT license. See LICENSE for details.

