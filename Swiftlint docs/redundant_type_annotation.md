# Redundant Type Annotation

Variables should not have redundant type annotation

* **Identifier:** redundant_type_annotation
* **Enabled by default:** No
* **Supports autocorrection:** Yes
* **Kind:** idiomatic
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
var url = URL()
```

```swift
var url: CustomStringConvertible = URL()
```

```swift
@IBInspectable var color: UIColor = UIColor.white
```

```swift
enum Direction {
    case up
    case down
}

var direction: Direction = .up
```

```swift
enum Direction {
    case up
    case down
}

var direction = Direction.up
```

## Triggering Examples

```swift
var url↓:URL=URL()
```

```swift
var url↓:URL = URL(string: "")
```

```swift
var url↓: URL = URL()
```

```swift
let url↓: URL = URL()
```

```swift
lazy var url↓: URL = URL()
```

```swift
let alphanumerics↓: CharacterSet = CharacterSet.alphanumerics
```

```swift
class ViewController: UIViewController {
  func someMethod() {
    let myVar↓: Int = Int(5)
  }
}
```

```swift
var isEnabled↓: Bool = true
```

```swift
enum Direction {
    case up
    case down
}

var direction↓: Direction = Direction.up
```