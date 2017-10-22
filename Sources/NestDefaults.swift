import UIKit

extension UIStackView {
    /// Stores the default values applied when nesting views. Change only during intialization!
    public struct NestDefaults {
        public var distribution: UIStackViewDistribution? = nil
        public var alignment: UIStackViewAlignment? = nil
        public var spacing: CGFloat? = nil
        public var margins: UIEdgeInsets? = nil
        public var furtherSetup: (UIStackView)->() = { _ in }
    }
}
