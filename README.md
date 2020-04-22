# ModernSegmentedProgressView

[![Version](https://img.shields.io/cocoapods/v/ModernSegmentedProgressView.svg?style=flat)](https://cocoapods.org/pods/ModernSegmentedProgressView)
[![License](https://img.shields.io/cocoapods/l/ModernSegmentedProgressView.svg?style=flat)](https://cocoapods.org/pods/ModernSegmentedProgressView)
[![Platform](https://img.shields.io/cocoapods/p/ModernSegmentedProgressView.svg?style=flat)](https://cocoapods.org/pods/ModernSegmentedProgressView)

## Example

![Example](https://raw.githubusercontent.com/dylandpowers/ModernSegmentedProgressView/master/images/example.png)

## Usage

The class is exported as a subclass of `UIView`, and thus can be added to any view with `addSubview()`. Note that the name of the exported class is `SegmentedProgressView`, which differs from the name of the library for simplicity. The first initializer uses default colors of `.orange` and `.darkGray` for the filled segments and empty segments, respectively.


```swift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let segmentedProgressView = SegmentedProgressView(numTotalSegments: 10,
                                                          numFilledSegments: 3,
                                                          totalViewWidth: 300)
        self.view.addSubview(segmentedProgressView)
    }
}
```

Alternatively, you can specify custom colors with the other initializer.

```swift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let segmentedProgressView = SegmentedProgressView(numTotalSegments: 10,
                                                          numFilledSegments: 3,
                                                          totalViewWidth: 300,
                                                          fillColor: .yellow,
                                                          noFillColor: .blue)
        self.view.addSubview(segmentedProgressView)
    }
}
```

## Requirements
* iOS 10.0 or higher
* Swift 4.0 or higher

## Installation

ModernSegmentedProgressView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ModernSegmentedProgressView'
```

## Author

dylandpowers, dylandpowers@gmail.com

## License

ModernSegmentedProgressView is available under the MIT license. See the LICENSE file for more info.
