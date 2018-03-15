import UIKit

extension UIStackView {
    /// Syntactic sugar for setting the layoutMargins of the stackView
    public var margins: UIEdgeInsets {
        get {
            if isLayoutMarginsRelativeArrangement {
                return layoutMargins
            } else {
                return .zero
            }
        }
        set {
            if margins == .zero {
                isLayoutMarginsRelativeArrangement = false
            } else {
                isLayoutMarginsRelativeArrangement = true
                layoutMargins = margins
            }
        }
    }
}
