import UIKit

extension UIView {
    @discardableResult public func snapEdges(
        in superview: UIView,
        margins:      UIEdgeInsets         = .zero,
        guides:       Set<LayoutGuideEdge> = [],
        priority:     UILayoutPriority?    = nil
        ) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(self)
        
        // The destination anchors
        var top      = superview.topAnchor
        var leading  = superview.leadingAnchor
        var bottom   = superview.bottomAnchor
        var trailing = superview.trailingAnchor
        
        // Configure anchors according to specified guides
        for guide in guides {
            switch guide {
            case .topGuide(let vc):
                if #available(iOS 11.0, *) {
                    top = superview.safeAreaLayoutGuide.topAnchor
                } else {
                    top = vc.topLayoutGuide.bottomAnchor
                }
            case .top:
                if #available(iOS 11.0, *) {
                    top = superview.safeAreaLayoutGuide.topAnchor
                }
            case .left:
                if #available(iOS 11.0, *) {
                    leading = superview.safeAreaLayoutGuide.leadingAnchor
                }
            case .bottomGuide(let vc):
                if #available(iOS 11.0, *) {
                    bottom = superview.safeAreaLayoutGuide.bottomAnchor
                } else {
                    bottom = vc.bottomLayoutGuide.topAnchor
                }
            case .bottom:
                if #available(iOS 11.0, *) {
                    bottom = superview.safeAreaLayoutGuide.bottomAnchor
                }
            case .right:
                if #available(iOS 11.0, *) {
                    trailing = superview.safeAreaLayoutGuide.trailingAnchor
                }
            }
        }
        
        // Snap view's anchors to destination anchors
        let constraints = [
            topAnchor.constraint(equalTo: top, constant: margins.top),
            leadingAnchor.constraint(equalTo: leading, constant: margins.left),
            bottomAnchor.constraint(equalTo: bottom, constant: -margins.bottom),
            trailingAnchor.constraint(equalTo: trailing, constant: -margins.right)
        ]
        
        // Set priority if needed
        if let priority = priority {
            for constraint in constraints {
                constraint.priority = priority
            }
        }
        
        NSLayoutConstraint.activate(constraints)
        return superview
    }
}
