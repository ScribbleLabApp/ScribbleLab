# Valid IBInspectable

@IBInspectable should be applied to variables only, have its type explicit and be of a supported type

* **Identifier:** valid_ibinspectable
* **Enabled by default:** Yes
* **Supports autocorrection:** No
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
class Foo {
  @IBInspectable private var x: Int
}
```

```swift
class Foo {
  @IBInspectable private var x: String?
}
```

```swift
class Foo {
  @IBInspectable private var x: String!
}
```

```swift
class Foo {
  @IBInspectable private var count: Int = 0
}
```

```swift
class Foo {
  private var notInspectable = 0
}
```

```swift
class Foo {
  private let notInspectable: Int
}
```

```swift
class Foo {
  private let notInspectable: UInt8
}
```

```swift
extension Foo {
    @IBInspectable var color: UIColor {
        set {
            self.bar.textColor = newValue
        }

        get {
            return self.bar.textColor
        }
    }
}
```

```swift
class Foo {
    @IBInspectable var borderColor: UIColor? = nil {
        didSet {
            updateAppearance()
        }
    }
}
```

## Triggering Examples

```swift
class Foo {
  @IBInspectable private ↓let count: Int
}
```

```swift
class Foo {
  @IBInspectable private ↓var insets: UIEdgeInsets
}
```

```swift
class Foo {
  @IBInspectable private ↓var count = 0
}
```

```swift
class Foo {
  @IBInspectable private ↓var count: Int?
}
```

```swift
class Foo {
  @IBInspectable private ↓var count: Int!
}
```

```swift
class Foo {
  @IBInspectable private ↓var count: Optional<Int>
}
```

```swift
class Foo {
  @IBInspectable private ↓var x: Optional<String>
}
```