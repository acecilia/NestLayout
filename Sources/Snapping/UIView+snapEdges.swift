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

import UIKit

extension UIView {
    /// Stores the default values applied when snapping views. Change only during intialization!
    public static var snapEdgesDefaults = SnapEdgesDefaults()
    
    @discardableResult public func snapEdges(
        in superview: UIView,
        margins: UIEdgeInsets = snapEdgesDefaults.margins,
        guides: Set<LayoutGuideEdge> = snapEdgesDefaults.guides,
        priority: UILayoutPriority? = snapEdgesDefaults.priority
        ) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(self)
        
        // The destination anchors
        var top = superview.topAnchor
        var leading = superview.leadingAnchor
        var bottom = superview.bottomAnchor
        var trailing = superview.trailingAnchor
        
        // Configure anchors according to specified guides
        for guide in guides {
            switch guide {
            case .topGuide(let guide):
                if #available(iOS 11.0, *) {
                    top = superview.safeAreaLayoutGuide.topAnchor
                } else {
                    top = guide.bottomAnchor
                }
            case .top:
                if #available(iOS 11.0, *) {
                    top = superview.safeAreaLayoutGuide.topAnchor
                }
            case .left:
                if #available(iOS 11.0, *) {
                    leading = superview.safeAreaLayoutGuide.leadingAnchor
                }
            case .bottomGuide(let guide):
                if #available(iOS 11.0, *) {
                    bottom = superview.safeAreaLayoutGuide.bottomAnchor
                } else {
                    bottom = guide.topAnchor
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
