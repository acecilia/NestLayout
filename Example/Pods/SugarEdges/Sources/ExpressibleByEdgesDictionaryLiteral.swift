/// A type that can be initialized using a dictionary of Edges, and their associated value
public protocol ExpressibleByEdgesDictionaryLiteral: ExpressibleByDictionaryLiteral {
    init(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat)
}

extension ExpressibleByEdgesDictionaryLiteral {
    public init(dictionaryLiteral elements: (Set<Edge>, CGFloat)...) {
        var top   : CGFloat = 0
        var left  : CGFloat = 0
        var bottom: CGFloat = 0
        var right : CGFloat = 0
        
        for (edges, value) in elements {
            if edges.contains(.top)    { top    = value }
            if edges.contains(.left)   { left   = value }
            if edges.contains(.bottom) { bottom = value }
            if edges.contains(.right)  { right  = value }
        }
        
        self = Self(top: top, left: left, bottom: bottom, right: right)
    }
}

extension Set where Element == Edge {
    public static var top:    Set<Edge> { return [.top] }
    public static var left:   Set<Edge> { return [.left] }
    public static var bottom: Set<Edge> { return [.bottom] }
    public static var right:  Set<Edge> { return [.right] }
    public static var all:    Set<Edge> { return top + left + bottom + right }
    
    public static func + (left: Set<Edge>, right: Set<Edge>) -> Set<Edge> {
        return left.union(right)
    }
}
