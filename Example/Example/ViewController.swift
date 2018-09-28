import UIKit
import CopyableLabel

class ViewController: UIViewController {

    @IBOutlet var copyableLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        copyableLabel.copyable = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(didShowCopyMenu(_:)), name: .copyableLabelDidShowCopyMenu, object: nil)
    }

    @objc func didShowCopyMenu(_ notification:NSNotification) {
        // Optionally register for copy didHide notification
    NotificationCenter.default.addObserver(self, selector: #selector(didHideCopyMenu(_:)), name: Notification.Name.UIMenuControllerDidHideMenu, object: nil)
        
        if let copyingText = notification.object as? UILabel {
            print(copyingText.text)
            let rect = notification.userInfo!["rect"] as! CGRect
            print(rect)
            // Do interesting stuff
        }
    }
    
    @objc func didHideCopyMenu(_ notification:NSNotification) {
        // Probably best to un-register for this notification
        NotificationCenter.default.removeObserver(self, name: .UIMenuControllerDidHideMenu, object: nil)
        // Do interesting stuff
    }
}

