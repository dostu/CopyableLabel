import UIKit
import CopyableLabel

class ViewController: UIViewController {

    @IBOutlet var copyableLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        copyableLabel.copyable = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(didShowCopyMenu(_:)), name: CopyableLabel.didShowCopyMenuNotification, object: nil)
    }

    @objc func didShowCopyMenu(_ notification:NSNotification) {
        // Optionally register for copy didHide notification
    NotificationCenter.default.addObserver(self, selector: #selector(didHideCopyMenu(_:)), name: UIMenuController.didHideMenuNotification, object: nil)
        
        if let copyingText = notification.object as? UILabel {
            print(copyingText.text as Any)
            // Do interesting stuff
        }
    }
    
    @objc func didHideCopyMenu(_ notification:NSNotification) {
        // Probably best to un-register for this notification
        NotificationCenter.default.removeObserver(self, name: UIMenuController.didHideMenuNotification, object: nil)
        // Do interesting stuff
    }
}

