import UIKit

extension UIView {
    /// Stores the default values applied when snapping views. Change only during intialization!
    public struct SnapEdgesDefaults {
        public var margins: UIEdgeInsets = .zero
        public var guides: Set<LayoutGuideEdge> = []
        public var priority: UILayoutPriority? = nil
    }
}
