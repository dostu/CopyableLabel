import UIKit
import CopyableLabel

class ViewController: UIViewController {

    @IBOutlet var copyableLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        copyableLabel.copyable = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(woot(_:)), name: .copyableLabelDidShowCopyMenu, object: nil)
    }

    @objc func woot(_ notification:NSNotification) {
        
        if let label = notification.object as? UILabel {
            print(label.text!)
        }
        print(notification.userInfo?["rect"] ?? "empty")
        
        // Do other interesting UI stuff here
    }
}
