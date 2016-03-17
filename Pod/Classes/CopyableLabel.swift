import UIKit

class CopyableLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)

        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        initialize()
    }

    func initialize() {
        userInteractionEnabled = true

        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "showCopyMenu")
        addGestureRecognizer(longPressGestureRecognizer)
    }

    func showCopyMenu() {
        let copyMenu = UIMenuController.sharedMenuController()

        guard !copyMenu.menuVisible else { return }

        becomeFirstResponder()

        copyMenu.setTargetRect(bounds, inView: self)
        copyMenu.setMenuVisible(true, animated: true)
    }

    override func canBecomeFirstResponder() -> Bool {
        return true
    }

    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        if action == "copy:" {
            return true
        }

        return super.canPerformAction(action, withSender: sender)
    }

    override func copy(sender: AnyObject?) {
        UIPasteboard.generalPasteboard().string = text
    }
    
}
