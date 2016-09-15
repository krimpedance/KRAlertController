# KRAlertController

[![Version](https://img.shields.io/cocoapods/v/KRAlertController.svg?style=flat)](http://cocoapods.org/pods/KRAlertController)
[![License](https://img.shields.io/cocoapods/l/KRAlertController.svg?style=flat)](http://cocoapods.org/pods/KRAlertController)
[![Platform](https://img.shields.io/cocoapods/p/KRAlertController.svg?style=flat)](http://cocoapods.org/pods/KRAlertController)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CI Status](http://img.shields.io/travis/krimpedance/KRAlertController.svg?style=flat)](https://travis-ci.org/krimpedance/KRAlertController)

`KRAlertController` is a beautiful and easy-to-use alert controller for your iOS written by Swift 2.

<img src="./Images/styles.png" height=300>

## Requirements
#### ver. 2.\* (current version)
- iOS 9.0+
- Xcode 8.0+
- Swift 3.\*

#### ver. 1.\*(1.1.0 and over)
- iOS 8.0+
- Xcode 8.0+
- Swift 2.3.\*

#### ver. 1.\*(under 1.1.0)
- iOS 8.0+
- Xcode 7.\*
- Swift 2.2.\*

## DEMO
To run the example project, clone the repo, and open `KRAlertControllerDemo.xcodeproj` from the DEMO directory.

or [appetize.io](https://appetize.io/app/jc2066a1jncndy2uet7wkp0ykg)

## Installation
KRAlertController is available through [CocoaPods](http://cocoapods.org) and [Carthage](https://github.com/Carthage/Carthage). 
To install it, simply add the following line to your Podfile or Cartfile:

```ruby
# Podfile
pod "KRAlertController"
```

```ruby
# Cartfile
github "Krimpedance/KRAlertController"
```

## Usage
(see sample Xcode project in /Demo)

**Mainly the same as UIAlertController.**

At first, import `KRAlertController` in your swift file.

Show simple alert.

```Swift
KRAlertController(title: "Title", message: "message")
  .addCancel()
  .addAction("OK") { action, textFields in
    print("OK")
  }
  .show()
```

### Initializer
```Swift
init(title: String?, message: String?, style: KRAlertControllerStyle = .Alert)
```

### Alert types
There is 7 kinds of alert.
`icon` pass true to display glaph icon; otherwise, pass false.
Default view controller to display alert is visible view controller of key window.
```Swift
func show(presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> ())? = nil)
func showSuccess(icon icon: Bool, presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> ())? = nil)
func showInformation(icon icon: Bool, presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> ())? = nil)
func showWarning(icon icon: Bool, presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> ())? = nil)
func showError(icon icon: Bool, presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> ())? = nil)
func showEdit(icon icon: Bool, presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> ())? = nil)
func showAuthorize(icon icon: Bool, presentingVC: UIViewController? = nil, animated: Bool = true, completion: (() -> ())? = nil)
```

```Swift
// Example
alert.showSuccess(true)
alert.showWarning(true, presentingVC: self, animated: false) {
  print("Showed warning alert!")
}
```

## Contributing to this project
I'm seeking bug reports and feature requests.

## Release Note
- 2.0.0 : Supported Swift3

## License
KRAlertController is available under the MIT license. See the LICENSE file for more info.
