# NestLayout
#### Syntactic sugar for StackViews layout

Yet, another autolayout framework. Why is this different?

In iOS9 Apple introduced StackViews as an easier, safer, more effective and more flexible way of configuring the layout (they are great ;P). But, after using them for a long time I find them too verbose, requiring several lines of code when I want to perform a simple layout change that is a bit more elaborated than usual. In the end, when the view layout grows in length and complexity, such an amount of unordered lines of code is prone to bugs, and difficult to read.

This framework makes exclusive use of StackViews for configuring the layout: basically you can see it as syntactic sugar for StackView based layouts. the benefits are:

  * The layout logic is implemented by Apple and the UIStackView class (AutoLayout is working behind the scenes), not a third party developer. This means that it is reliable in terms of **good performance and minimal implementation bugs**.
  * The API exposed by this framework will not change as long as the API exposed by UIStackView does not change. This means that it is reliable in terms of **long-term maintainability**.
  * The API exposed by this framework is exacly the same as the one exposed by the UIStackView class. This means that it has a **minimal learning curve**, and together with autocompletion is super discoverable and easy to use.
  * The **source** code of this framework is **under 200 lines**: nothing to worry about if you do not feel confortable about adding another dependency to your project.
  * The API exposed by this framework keeps your **code tidy, easier to read and more expressive**. In the end, **less prone to bugs**.

## Usage
hFixed corresponds to views with height constraint (in red color). hwFixed corresponds to views with height and width constraints (in orange color):

```swift
UIStackView(hFixedView1, axis: .vertical, spacing: 10)
    .nest(label, alignment: .center)
    .nest(alignment: .center) {
        $0.nest(hwFixedView1, hwFixedView2, axis: .horizontal, alignment: .top)
    }
    .nest(hFixedView2, margins: [.left + .right: 30]) // This way of setting the margins is provided by the framework SugarEdges
    .snapEdges(in: contentView)
```

The result: 

<p align="center">
  <img src="Images/example.png?raw=true" alt="Example"/>
</p>

## Example
To run the example project, clone the repo, and open the workspace found under the ```Example``` folder with Xcode.

## Requirements
In order to easily set the margins when using NestLayout, it is recommended (but not mandatory) to also install [SugarEdges](https://github.com/acecilia/SugarEdges).

## Installation

NestLayout is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NestLayout'
```

## Author

Andrés Cecilia Luque (acecilia), a.cecilia.luque@gmail.com

## License

NestLayout is available under the MIT license. See the LICENSE file for more info.
