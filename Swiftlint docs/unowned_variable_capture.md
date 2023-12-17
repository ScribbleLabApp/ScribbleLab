# Unowned Variable Capture

Prefer capturing references as weak to avoid potential crashes

* **Identifier:** unowned_variable_capture
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
  </tbody>
  </table>

## Non Triggering Examples

```swift
foo { [weak self] in _ }
```

```swift
foo { [weak self] param in _ }
```

```swift
foo { [weak bar] in _ }
```

```swift
foo { [weak bar] param in _ }
```

```swift
foo { bar in _ }
```

```swift
foo { $0 }
```

```swift
final class First {}
final class Second {
  unowned var value: First
  init(value: First) {
    self.value = value
  }
}
```

## Triggering Examples

```swift
foo { [↓unowned self] in _ }
```

```swift
foo { [↓unowned bar] in _ }
```

```swift
foo { [bar, ↓unowned self] in _ }
```