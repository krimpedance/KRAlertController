# KRAlertController

[![Version](https://img.shields.io/cocoapods/v/KRAlertController.svg?style=flat)](http://cocoapods.org/pods/KRAlertController)
[![License](https://img.shields.io/cocoapods/l/KRAlertController.svg?style=flat)](http://cocoapods.org/pods/KRAlertController)
[![Platform](https://img.shields.io/cocoapods/p/KRAlertController.svg?style=flat)](http://cocoapods.org/pods/KRAlertController)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CI Status](http://img.shields.io/travis/krimpedance/KRAlertController.svg?style=flat)](https://travis-ci.org/krimpedance/KRAlertController)

`KRAlertController` is a beautiful and easy-to-use alert controller for your iOS written by Swift 2.

<img src="./Images/styles.png" height=300>

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
let alert = KRAlertController(title: "Title", message: "message")
let action = KRAlertAction(title: "Cancel", style: .Cancel, handler: nil)
alert.addAction(action)
alert.show()
```

### Initializer
```
init(title: String?, message: String?)
init(title: String?, message: String?, style: KRAlertControllerStyle)
init(title: String?, message: String?, style: KRAlertControllerStyle, type: KRAlertControllerType)
```

### Alert types
Alert icon is indicated by `icon` parameter.
```
enum KRAlertControllerType {
  case Normal
  case Success(icon: Bool)
  case Information(icon: Bool)
  case Warning(icon: Bool)
  case Error(icon: Bool)
  case Edit(icon: Bool)
  case Authorize(icon: Bool)
}
```

## Contributing to this project
I'm seeking bug reports and feature requests.

## Release Note
- 0.1.0 : First release

## License
KRAlertController is available under the MIT license. See the LICENSE file for more info.
