/// The possible edges of a LayoutGuide
public enum LayoutGuideEdge {
    @available(iOS, introduced: 7.0, deprecated: 11.0, renamed: "top")
    case topGuide(UIViewController)
    
    @available(iOS, introduced: 11.0)
    case top
    
    case left
    
    @available(iOS, introduced: 7.0, deprecated: 11.0, renamed: "bottom")
    case bottomGuide(UIViewController)
    
    @available(iOS, introduced: 11.0)
    case bottom
    
    case right
}

// MARK: - Necessary extensions in order to be able to use LayoutGuideEdge inside Set

extension LayoutGuideEdge: Hashable {
    public var hashValue: Int {
        switch self {
        case .topGuide: return 1
        case .top: return 1
        case .left: return 2
        case .bottomGuide: return 3
        case .bottom: return 3
        case .right: return 4
        }
    }
    
    public static func ==(lhs: LayoutGuideEdge, rhs: LayoutGuideEdge) -> Bool {
        switch (lhs, rhs) {
        case (.topGuide, .topGuide),
             (.top, .top),
             (.topGuide, .top),
             (.top, .topGuide),
             
             (.left, .left),
             
             (.bottomGuide, .bottomGuide),
             (.bottom, .bottom),
             (.bottomGuide, .bottom),
             (.bottom, .bottomGuide),
             
             (.right, .right):
            return true
            
        default: return false
        }
    }
}

extension Set where Element == LayoutGuideEdge {
    @available(iOS, introduced: 7.0, deprecated: 11.0, renamed: "top")
    public static func topGuide(_ vc: UIViewController) -> Set<LayoutGuideEdge> { return [.topGuide(vc)] }
    
    @available(iOS, introduced: 11.0)
    public static var top:Set<LayoutGuideEdge> { return [.top] }
    
    public static var left:Set<LayoutGuideEdge> { return [.left] }
    
    @available(iOS, introduced: 7.0, deprecated: 11.0, renamed: "bottom")
    public static func bottomGuide(_ vc: UIViewController) -> Set<LayoutGuideEdge> { return [.bottomGuide(vc)] }
    
    @available(iOS, introduced: 11.0)
    public static var bottom:Set<LayoutGuideEdge> { return [.bottom] }
    
    public static var right:Set<LayoutGuideEdge> { return [.right] }
    
    @available(iOS, introduced: 7.0, deprecated: 11.0, renamed: "all")
    public static func allGuides(_ vc: UIViewController) -> Set<LayoutGuideEdge> {
        return topGuide(vc) + left + bottomGuide(vc) + right
    }
    
    @available(iOS, introduced: 11.0)
    public static var all: Set<LayoutGuideEdge> { return top + left + bottom + right }
    
    public static func + (left: Set<LayoutGuideEdge>, right: Set<LayoutGuideEdge>) -> Set<LayoutGuideEdge> {
        return left.union(right)
    }
}
