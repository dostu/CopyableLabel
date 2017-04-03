import UIKit
import CopyableLabel

class ViewController: UIViewController {

    @IBOutlet var copyableLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        copyableLabel.copyable = true
    }

}

