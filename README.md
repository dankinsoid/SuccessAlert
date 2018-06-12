# SuccessAlert

## Usage
```swift
import SuccessAlert
```
To show the alert use:
```swift
SuccessAlert.show(title: String, message: String?, delay: Double, view: AnimatedView?, color: UIColor?, textColor: UIColor?, blur: UIBlurEffectStyle?, completion: (() -> ())?)
```
or this: 
```swift
SuccessAlert.show(title: String, message: String?, delay: Double, image: UIImage, color: UIColor?, textColor: UIColor?, blur: UIBlurEffectStyle?, completion: (() -> ())?)
```
where:
title - alert title, "Выполнено" by default;
message - alert message, empty by default;
delay - alert display duration in seconds, 0.4 by default;
view - alert icon, CheckView() by default;
image - alert icon with image, an image is represented with "alwaysTemplate" rendering mode
color - icon color, icon view tintColor by default;
textColor - title and message color, 28% in grayscale by default;
blur - alert blur effect style, extraLight by default;

AnimatedView is typealias: 
```swift
public typealias AnimatedView = AnimatedViewProtocol & UIView
```
AnimatedViewProtocol - protocol for views that can be animated;

<table>
  <tr>
    <th width="30%">Here's an example</th>
    <th width="30%">In Action</th>
  </tr>
  <tr>
    <td>
        1: SuccessAlert.show(title: "Добавлено")
        2: SuccessAlert.show(message: "Запись успешно добавлена")
        3: SuccessAlert.show(title: "Добавлено", message: "Запись успешно добавлена", color: .white, textColor: .white, blur: .dark)
        4: SuccessAlert.show(title: "Добавлено", message: "Запись успешно добавлена", color: #colorLiteral(red: 0, green: 0.8379185268, blue: 0.3353787327, alpha: 1), textColor: #colorLiteral(red: 0, green: 0.8379185268, blue: 0.3353787327, alpha: 1))
        5: SuccessAlert.show()
        6: SuccessAlert.show(title: "Удалить не удалось!", view: CrossView())
        7: SuccessAlert.show(title: "Удалено", image: UIImage(named: "trash")!, color: #colorLiteral(red: 0.3489781618, green: 0.3490435183, blue: 0.3489740491, alpha: 1)) {
              self.navigationController?.popToRootViewController(animated: true)
            }
      </td>
    <td rowspan="9"><img src="https://preview.ibb.co/gQZied/IMG_9444_TRIM.gif"></td>
  </tr>
</table>

Also there is a BezierAnimatedView class for creating animated views with UIBezierPath. You can initialize this class with UIBezierPath, or create a subclass and override "var bezier: UIBezierPath".

## Installation

SuccessAlert doesn't contain any external dependencies.

These are currently the supported options:

### Manual

* Drag `Rx.xcodeproj` into Project Navigator
* Go to `Project > Targets > General > Embedded Binaries`, click `+` and select `SuccessAlert` target

### [Carthage](https://github.com/Carthage/Carthage)

Add this to `Cartfile`

```
git "https://github.com/dankinsoid/SuccessAlert.git" "master"
```

```bash
$ carthage update
```
