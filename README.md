# CopyableLabel

UILabel extension to enable copying

![Screenshot](http://i.imgur.com/7kyuTS9.png)

## Usage

```swift
import CopyableLabel

let label = UILabel()
label.copyable = true
```

Or set copyable property to true in Interface Builder.  

If another object (e.g. UIViewController) has a need to know which CopyableLabel has invoked the UIMenuController (i.e. presented the 'Copy' balloon, register the object for `Notification.name.copyableLabelDidShowCopyMenu` notification:

```
NotificationCenter.default.addObserver(self, selector: #selector(receivedCopyableLabelNotification(_:)), name: .copyableLabelDidShowCopyMenu, object: nil)
```

The registering object will receive a Notification that contains a reference to the CopyableLabel that posted the notification.

```
@objc func receivedCopyableLabelNotification(_ notification:NSNotification) {
	if let label = notification.object as? UILabel {
		print(label.text!)
	}
}
```

UIMenuController does post a UIMenuController.didShowMenuNotification, however that notification does not provide any additional information (i.e. which UI elemement posted the notification, where the menu is, etc.).  

Register for the UIMenuController willHide or didHide notifications, if you need to know when the menu is dismissed.


## Requirements

iOS 9 or higher

## Installation

### CocoaPods

CopyableLabel is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "CopyableLabel"
```

### Carthage

You can use Carthage to install CopyableLabel by adding it to your Cartfile:

github "weby/CopyableLabel"

## Author

Donatas Stundys, donatas.stundys@gmail.com

## License

CopyableLabel is available under the MIT license. See the LICENSE file for more info.
