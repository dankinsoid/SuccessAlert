# SuccessAlert

## Usage
```swift
import SuccessAlert
```
To show the alert use:
```swift
SuccessAlert.show(title: String, message: String?, delay: Double, view: AnimatedView?, color: UIColor?, textColor: UIColor?, blur: UIBlurEffectStyle?, completion: (() -> ())?)
```
or 
```swift
SuccessAlert.show(title: String, message: String?, delay: Double, image: UIImage, color: UIColor?, textColor: UIColor?, blur: UIBlurEffectStyle?, completion: (() -> ())?)
```
where:
* title - alert title, "Выполнено" by default;
* message - alert message, empty by default;
* delay - alert display duration in seconds, 0.4 by default;
* view - alert icon, `CheckView()` by default;
* image - alert icon with image, an image is represented with `alwaysTemplate` rendering mode;
* color - icon color, icon view `tintColor` by default;
* textColor - title and message color, 28% in grayscale by default;
* blur - alert blur effect style, extraLight by default;

`AnimatedView` is typealias: 
```swift
public typealias AnimatedView = AnimatedViewProtocol & UIView
```
`AnimatedViewProtocol` - protocol for views that can be animated;

### Here's an example
#### In Action
<div style="height:300pt">
<img src="https://psv4.userapi.com/c848136/u73750576/docs/d12/2ae39bfdc481/IMG_9444_TRIM.gif?extra=auhHYZPO_okWhCm_eBB3avmjSvNXhahub9Vv-sEyL-jCzKiDAke02Y6_d76CtkEPnxeUyElSD_Lwj-edXu4oecB9NC96vFKZKnIHA3WDZbuPudL-_OM0Qx9VnD4pqpj0jr_wu6wEGg">
<div>

#### Code

```swift
 1: SuccessAlert.show(title: "Добавлено")
 2: SuccessAlert.show(message: "Запись успешно добавлена")
 3: SuccessAlert.show(title: "Добавлено", message: "Запись успешно добавлена", color: .white, textColor: .white, blur: .dark)
 4: SuccessAlert.show(title: "Добавлено", message: "Запись успешно добавлена", color: AppColor.green, textColor: AppColor.green)
 5: SuccessAlert.show()
 6: SuccessAlert.show(title: "Удалить не удалось!", view: CrossView())
 7: SuccessAlert.show(title: "Удалено", image: UIImage(named: "trash")!, color: AppColor.gray) {
              self.navigationController?.popToRootViewController(animated: true)
    }
```

Also there is a `BezierAnimatedView` class for creating animated views with `UIBezierPath`. You can initialize this class with `UIBezierPath`, or create a subclass and override `var bezier: UIBezierPath`.

## Installation

SuccessAlert doesn't contain any external dependencies.

These are currently the supported options:

### Manual

* Drag `SuccessAlert.xcodeproj` into Project Navigator
* Go to `Project > Targets > General > Embedded Binaries`, click `+` and select `SuccessAlert` target

### [Carthage](https://github.com/Carthage/Carthage)

Add this to `Cartfile`

```
git "https://github.com/dankinsoid/SuccessAlert.git" "master"
```

```bash
$ carthage update
```
