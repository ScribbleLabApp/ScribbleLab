# Fatal Error Message

A fatalError call should have a message

* **Identifier:** fatal_error_message
* **Enabled by default:** No
* **Supports autocorrection:** No
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
func foo() {
  fatalError("Foo")
}
```

```swift
func foo() {
  fatalError(x)
}
```

## Triggering Examples

```swift
func foo() {
  ↓fatalError("")
}
```

```swift
func foo() {
  ↓fatalError()
}
```