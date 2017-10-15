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
    
    let tabPanel: FATabPanel = {
        let v = FATabPanel()
        v.tabBarBackgroundColor = UIColor.orange
        v.tabBarColor = UIColor.white
        return v
    }()
    
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
        let view1 = UIView(), view2 = UIView(), label1 = UILabel(), label2 = UILabel()

        label1.text = "View 1"
        label2.text = "View 2"
        
        label1.addSCConstraints { sc in
            view1.addSubview(sc)
            sc.constraintWithAttribute(to: view1, attribute: .center)
        }
        
        label2.addSCConstraints { sc in
            view2.addSubview(sc)
            sc.constraintWithAttribute(to: view2, attribute: .center)
        }
        
        tabPanel.items = [
            FATabPanelItem(title: .FAHome, card: view1),
            FATabPanelItem(title: .FAMap, card: view2)
        ]
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

