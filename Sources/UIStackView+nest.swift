import UIKit

extension UIStackView {
    /// Adds the views to the stackView, allowing optional customization of the layout
    @discardableResult public func nest(
        _ views: UIView...,
        axis: UILayoutConstraintAxis? = nil,
        distribution: UIStackViewDistribution? = nil,
        alignment: UIStackViewAlignment? = nil,
        spacing: CGFloat? = nil,
        margins: UIEdgeInsets? = nil,
        furtherSetup: (UIStackView)->() = { _ in }
        ) -> UIStackView {
        let stackView = UIStackView(views, axis: axis ?? self.axis, distribution: distribution, alignment: alignment, spacing: spacing, margins: margins, furtherSetup: furtherSetup)
        addArrangedSubview(stackView)
        return self
    }
    
    /// Adds the views to the stackView. Required in order to avoid nesting when it is not necessary
    @discardableResult public func nest(_ views: UIView...) -> UIStackView {
        for view in views { addArrangedSubview(view) }
        return self
    }
}
