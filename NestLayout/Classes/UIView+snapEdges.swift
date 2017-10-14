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
    @discardableResult public func snapEdges(
        in superview: UIView,
        margins: UIEdgeInsets = .zero,
        topLayoutGuide: UILayoutSupport? = nil,
        bottomLayoutGuide: UILayoutSupport? = nil,
        priority: UILayoutPriority? = nil
        ) -> (top: NSLayoutConstraint, leading: NSLayoutConstraint, bottom: NSLayoutConstraint, trailing: NSLayoutConstraint) {
        translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(self)
        
        let constraints = (
            top: topAnchor.constraint(equalTo: topLayoutGuide?.bottomAnchor ?? superview.topAnchor, constant: margins.top),
            leading: leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: margins.left),
            bottom: bottomAnchor.constraint(equalTo: bottomLayoutGuide?.topAnchor ?? superview.bottomAnchor, constant: -margins.bottom),
            trailing: trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -margins.right)
        )
        
        let constraintsArray = [
            constraints.top,
            constraints.leading,
            constraints.bottom,
            constraints.trailing
        ]
        
        if let priority = priority {
            for constraint in constraintsArray {
                constraint.priority = priority
            }
        }
        
        NSLayoutConstraint.activate(constraintsArray)
        return constraints
    }
}
