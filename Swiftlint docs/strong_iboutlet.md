# Strong IBOutlet

@IBOutlets shouldn't be declared as weak

* **Identifier:** strong_iboutlet
* **Enabled by default:** No
* **Supports autocorrection:** Yes
* **Kind:** lint
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.0.0
* **Default configuration:**
  <table>
  <thead>
  <tr><th>Key</th><th>Value</th></tr>
  </thead>
  <tbody>
  <tr>
  <td>
  severity
  </td>
  <td>
  warning
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
class ViewController: UIViewController {
    @IBOutlet var label: UILabel?
}
```

```swift
class ViewController: UIViewController {
    weak var label: UILabel?
}
```

## Triggering Examples

```swift
class ViewController: UIViewController {
    @IBOutlet ↓weak var label: UILabel?
}
```

```swift
class ViewController: UIViewController {
    @IBOutlet ↓unowned var label: UILabel!
}
```

```swift
class ViewController: UIViewController {
    @IBOutlet ↓weak var textField: UITextField?
}
```