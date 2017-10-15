# SugarEdges
Syntactic sugar for init UIEdgeInsets and other similar objects.

## Usage
Remember to import SugarEdges at the top of the file:

```swift
import SugarEdges
```

Then, instead of initiating like this:

```swift
let insets: UIEdgeInsets = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
```

You can do it like this:

```swift
let insets: UIEdgeInsets = [.top: 20, .left + .right: 10]
```

If you want to use this kind of initialization for other types, just make them conform to the ```ExpressibleByEdgesDictionaryLiteral``` protocol.

## Example

To run the example project, clone the repo, and open the workspace found under the ```Example``` folder with Xcode.

## Installation

SugarEdges is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SugarEdges'
```

## Author

Andres Cecilia Luque (acecilia), a.cecilia.luque@gmail.com

## License

SugarEdges is available under the MIT license. See the LICENSE file for more info.
