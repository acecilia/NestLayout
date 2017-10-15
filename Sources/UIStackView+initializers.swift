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

extension UIStackView {
    convenience init(
        _ views: [UIView],
        axis: UILayoutConstraintAxis? = nil,
        distribution: UIStackViewDistribution? = nil,
        alignment: UIStackViewAlignment? = nil,
        spacing: CGFloat? = nil,
        margins: UIEdgeInsets? = nil,
        furtherSetup: (UIStackView)->() = { _ in }
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
        distribution: UIStackViewDistribution? = nil,
        alignment: UIStackViewAlignment? = nil,
        spacing: CGFloat? = nil,
        margins: UIEdgeInsets? = nil,
        furtherSetup: (UIStackView)->() = { _ in }
        ) {
        self.init(views, axis: axis, distribution: distribution, alignment: alignment, spacing: spacing, margins: margins, furtherSetup: furtherSetup)
    }
}
