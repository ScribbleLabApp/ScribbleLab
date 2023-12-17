# Private Outlets

IBOutlets should be private to avoid leaking UIKit to higher layers

* **Identifier:** private_outlet
* **Enabled by default:** No
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
  <tr>
  <td>
  allow_private_set
  </td>
  <td>
  false
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
class Foo { @IBOutlet private var label: UILabel? }
```

```swift
class Foo { @IBOutlet private var label: UILabel! }
```

```swift
class Foo { var notAnOutlet: UILabel }
```

```swift
class Foo { @IBOutlet weak private var label: UILabel? }
```

```swift
class Foo { @IBOutlet private weak var label: UILabel? }
```

```swift
class Foo { @IBOutlet fileprivate weak var label: UILabel? }
```

```swift
class Foo { @IBOutlet private(set) var label: UILabel? }
```

```swift
class Foo { @IBOutlet private(set) var label: UILabel! }
```

```swift
class Foo { @IBOutlet weak private(set) var label: UILabel? }
```

```swift
class Foo { @IBOutlet private(set) weak var label: UILabel? }
```

```swift
class Foo { @IBOutlet fileprivate(set) weak var label: UILabel? }
```

## Triggering Examples

```swift
class Foo { @IBOutlet ↓var label: UILabel? }
```

```swift
class Foo { @IBOutlet ↓var label: UILabel! }
```

```swift
class Foo { @IBOutlet private(set) ↓var label: UILabel? }
```

```swift
class Foo { @IBOutlet fileprivate(set) ↓var label: UILabel? }
```