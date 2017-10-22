import UIKit

extension UIStackView {
    /// Adds the views to the stackView, allowing optional customization of the layout
    @discardableResult public func nest(
        _ views: UIView...,
        axis: UILayoutConstraintAxis? = nil,
        distribution: UIStackViewDistribution? = nestDefaults.distribution,
        alignment: UIStackViewAlignment? = nestDefaults.alignment,
        spacing: CGFloat? = nestDefaults.spacing,
        margins: UIEdgeInsets? = nestDefaults.margins,
        furtherSetup: (UIStackView)->() = nestDefaults.furtherSetup
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
