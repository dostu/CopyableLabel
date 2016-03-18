import UIKit

public extension UILabel {

    private struct AssociatedKeys {
        static var copyable = "copyable"
        static var longPressGestureRecognizer = "longPressGestureRecognizer"
    }

    @IBInspectable var copyable: Bool {
        get {
            guard let number = objc_getAssociatedObject(self, &AssociatedKeys.copyable) as? NSNumber else {
                return true
            }

            return number.boolValue
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKeys.copyable, NSNumber(bool: newValue),
                objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            newValue ? enableCopying() : disableCopying()
        }
    }

    var longPressGestureRecognizer: UILongPressGestureRecognizer? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.longPressGestureRecognizer) as?
                UILongPressGestureRecognizer
        }

        set {
            objc_setAssociatedObject(self, &AssociatedKeys.longPressGestureRecognizer, newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    func enableCopying() {
        userInteractionEnabled = true

        longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "showCopyMenu")
        addGestureRecognizer(longPressGestureRecognizer!)
    }

    func disableCopying() {
        userInteractionEnabled = false

        if let gestureRecognizer = longPressGestureRecognizer {
            removeGestureRecognizer(gestureRecognizer)
            longPressGestureRecognizer = nil
        }
    }

    func showCopyMenu() {
        let copyMenu = UIMenuController.sharedMenuController()

        guard !copyMenu.menuVisible else { return }

        becomeFirstResponder()

        copyMenu.setTargetRect(bounds, inView: self)
        copyMenu.setMenuVisible(true, animated: true)
    }

    public override func canBecomeFirstResponder() -> Bool {
        return true
    }

    public override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        if action == "copy:" {
            return true
        }

        return super.canPerformAction(action, withSender: sender)
    }

    public override func copy(sender: AnyObject?) {
        UIPasteboard.generalPasteboard().string = text
    }
    
}
