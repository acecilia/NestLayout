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

/// A type that can be initialized using a dictionary of Edges, and their associated value
public protocol ExpressibleByEdgesDictionaryLiteral: ExpressibleByDictionaryLiteral {
    init(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat)
}

extension ExpressibleByEdgesDictionaryLiteral {
    public typealias Key   = Set<Edge>
    public typealias Value = CGFloat
    
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
