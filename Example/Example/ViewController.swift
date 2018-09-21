import UIKit
import CopyableLabel

class ViewController: UIViewController {

    @IBOutlet var copyableLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        copyableLabel.copyable = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(woot(_:)), name: .didShowCopyMenu, object: nil)
    }

    @objc func woot(_ n:NSNotification) {
        print("woot")
    }
}

