# SuccessAlert

## Usage

<table>
  <tr>
    <th width="30%">Here's an example</th>
    <th width="30%">In Action</th>
  </tr>
  <tr>
    <td>Examples</td>
    <th rowspan="9"><img src="https://preview.ibb.co/gQZied/IMG_9444_TRIM.gif" alt="IMG_9444_TRIM" border="0"></th>
  </tr>
  <tr>
    <td><div><pre>
```swift
        1:
            SuccessAlert.show(title: "Добавлено")
        2:
            SuccessAlert.show(message: "Запись успешно добавлена")
        3:
            SuccessAlert.show(title: "Добавлено", message: "Запись успешно добавлена", color: .white, textColor: .white, blur: .dark)
        4:
            SuccessAlert.show(title: "Добавлено", message: "Запись успешно добавлена", color: #colorLiteral(red: 0, green: 0.8379185268, blue: 0.3353787327, alpha: 1), textColor: #colorLiteral(red: 0, green: 0.8379185268, blue: 0.3353787327, alpha: 1))
        5:
            SuccessAlert.show()
        6: 
            SuccessAlert.show(title: "Удалить не удалось!", view: CrossView())
        7: 
            SuccessAlert.show(title: "Удалено", image: UIImage(named: "trash")!, color: #colorLiteral(red: 0.3489781618, green: 0.3490435183, blue: 0.3489740491, alpha: 1)) {
              self.navigationController?.popToRootViewController(animated: true)
            }
```
</pre></div></td>
  </tr>
</table>

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
