import UIKit

extension UIStackView {
    /// Stores the default values applied when nesting views. Change only during intialization!
    public static var nestDefaults = NestDefaults()
    
    convenience init(
        _ views: [UIView],
        axis: UILayoutConstraintAxis? = nil,
        distribution: UIStackViewDistribution? = nestDefaults.distribution,
        alignment: UIStackViewAlignment? = nestDefaults.alignment,
        spacing: CGFloat? = nestDefaults.spacing,
        margins: UIEdgeInsets? = nestDefaults.margins,
        furtherSetup: (UIStackView)->() = nestDefaults.furtherSetup
        ) {
        self.init(arrangedSubviews: views)
        if let axis = axis { self.axis = axis }
        if let distribution = distribution { self.distribution = distribution }
        if let alignment = alignment { self.alignment = alignment }
        if let spacing = spacing { self.spacing = spacing }
        if let margins = margins {
            self.isLayoutMarginsRelativeArrangement = true
            self.layoutMargins = margins
        }
        
        furtherSetup(self)
    }
}

extension UIStackView {
    /// A convenient initializer for UIStackView that allows to coustomize all it's properties in one line
    public convenience init(
        _ views: UIView...,
        axis: UILayoutConstraintAxis? = nil,
        distribution: UIStackViewDistribution? = nestDefaults.distribution,
        alignment: UIStackViewAlignment? = nestDefaults.alignment,
        spacing: CGFloat? = nestDefaults.spacing,
        margins: UIEdgeInsets? = nestDefaults.margins,
        furtherSetup: (UIStackView)->() = nestDefaults.furtherSetup
        ) {
        self.init(views, axis: axis, distribution: distribution, alignment: alignment, spacing: spacing, margins: margins, furtherSetup: furtherSetup)
    }
}
