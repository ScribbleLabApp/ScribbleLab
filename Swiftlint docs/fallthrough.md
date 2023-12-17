# Fallthrough

Fallthrough should be avoided

* **Identifier:** fallthrough
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
switch foo {
case .bar, .bar2, .bar3:
  something()
}
```

## Triggering Examples

```swift
switch foo {
case .bar:
  ↓fallthrough
case .bar2:
  something()
}
```