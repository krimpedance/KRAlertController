[English](./README.md)

# KRAlertController

[![Version](https://img.shields.io/cocoapods/v/KRAlertController.svg?style=flat)](http://cocoapods.org/pods/KRAlertController)
[![License](https://img.shields.io/cocoapods/l/KRAlertController.svg?style=flat)](http://cocoapods.org/pods/KRAlertController)
[![Platform](https://img.shields.io/cocoapods/p/KRAlertController.svg?style=flat)](http://cocoapods.org/pods/KRAlertController)
[![Download](https://img.shields.io/cocoapods/dt/KRAlertController.svg?style=flat)](http://cocoapods.org/pods/KRAlertController)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CI Status](http://img.shields.io/travis/krimpedance/KRAlertController.svg?style=flat)](https://travis-ci.org/krimpedance/KRAlertController)

`KRAlertController`はピュアSwiftの綺麗で使いやすいアラートコントローラーです.

<img src="https://github.com/krimpedance/Resources/blob/master/KRAlertController/styles.png" height=300>

## 必要環境
- iOS 10.0+
- Xcode 9.0+
- Swift 4.0+

## デモ
`DEMO/`以下にあるサンプルプロジェクトから確認してください.

または, [appetize.io](https://appetize.io/app/jc2066a1jncndy2uet7wkp0ykg)にてシュミレートしてください.

## インストール
KRAlertControllerは[CocoaPods](http://cocoapods.org)と[Carthage](https://github.com/Carthage/Carthage)で
インストールすることができます.

```ruby
# Podfile
pod "KRAlertController"
```

```ruby
# Cartfile
github "Krimpedance/KRAlertController"
```

## 使い方
(`/Demo`以下のサンプルを見てみてください)

**大まかな使い方はUIAlertControllerと同じです.**

まず, `KRAlertController`をインポートします.

シンプルなアラートの表示

```Swift
KRAlertController(title: "Title", message: "message")
  .addCancel()
  .addAction("OK") { action, textFields in
    print("OK")
  }
  .show()
```

### イニシャライザ
```Swift
init(title: String?, message: String?, style: KRAlertControllerStyle = .Alert)
```

### アラートの種類
KRAlertControllerには7種類のアラートがあります.

それぞれ色やアイコンが異なり, 用途によって使い分けます.
`icon`を`false`にすると, アイコンを非表示にできます.

`presentingVC`には表示するViewControllerを設定します.
未設定の場合は, `keyWindow`の最前面のViewControllerに表示されます.

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

## ライブラリに関する質問等
バグや機能のリクエストがありましたら, 気軽にコメントしてください.

## リリースノート
+ 3.0.1 :
  - Swift 4.1 に対応

+ 3.0.0 :
  - Xcode9, Swift4 に対応

## ライセンス
KRAlertControllerはMITライセンスに準拠しています.

詳しくは`LICENSE`ファイルをみてください.
