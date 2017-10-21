// The MIT License (MIT)
//
// Copyright (c) 2017 Andres Cecilia Luque (acecilia) <a.cecilia.luque@gmail.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

/// The possible edges of a LayoutGuide
public enum LayoutGuideEdge {
    @available(iOS, introduced: 7.0, deprecated: 11.0, renamed: "top")
    case topGuide(UILayoutSupport)
    
    @available(iOS, introduced: 11.0)
    case top
    
    case left
    
    @available(iOS, introduced: 7.0, deprecated: 11.0, renamed: "bottom")
    case bottomGuide(UILayoutSupport)
    
    @available(iOS, introduced: 11.0)
    case bottom
    
    case right
}

// MARK: - Necessary extensions in order to be able to use LayoutGuideEdge inside Set

extension LayoutGuideEdge: Hashable {
    public var hashValue: Int {
        switch self {
        case .topGuide: return 1
        case .top: return 2
        case .left: return 3
        case .bottomGuide: return 4
        case .bottom: return 5
        case .right: return 6
        }
    }
    
    public static func ==(lhs: LayoutGuideEdge, rhs: LayoutGuideEdge) -> Bool {
        switch (lhs, rhs) {
        case (.topGuide, .topGuide),
             (.top, .top),
             (.left, .left),
             (.bottomGuide, .bottomGuide),
             (.bottom, .bottom),
             (.right, .right):
            return true
            
        default: return false
        }
    }
}

extension Set where Element == LayoutGuideEdge {
    @available(iOS, introduced: 7.0, deprecated: 11.0, renamed: "top")
    public static func topGuide(_ guide: UILayoutSupport) -> Set<LayoutGuideEdge> { return [.topGuide(guide)] }
    
    @available(iOS, introduced: 11.0)
    public static var top:Set<LayoutGuideEdge> { return [.top] }
    
    public static var left:Set<LayoutGuideEdge> { return [.left] }
    
    @available(iOS, introduced: 7.0, deprecated: 11.0, renamed: "bottom")
    public static func bottomGuide(_ guide: UILayoutSupport) -> Set<LayoutGuideEdge> { return [.bottomGuide(guide)] }
    
    @available(iOS, introduced: 11.0)
    public static var bottom:Set<LayoutGuideEdge> { return [.bottom] }
    
    public static var right:Set<LayoutGuideEdge> { return [.right] }
    
    @available(iOS, introduced: 7.0, deprecated: 11.0, renamed: "all")
    public static func allGuides(top: UILayoutSupport, bottom: UILayoutSupport) -> Set<LayoutGuideEdge> {
        return topGuide(top) + left + bottomGuide(bottom) + right
    }
    
    @available(iOS, introduced: 11.0)
    public static var all: Set<LayoutGuideEdge> { return top + left + bottom + right }
    
    public static func + (left: Set<LayoutGuideEdge>, right: Set<LayoutGuideEdge>) -> Set<LayoutGuideEdge> {
        return left.union(right)
    }
}
