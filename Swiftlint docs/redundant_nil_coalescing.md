# Redundant Nil Coalescing

nil coalescing operator is only evaluated if the lhs is nil, coalescing operator with nil as rhs is redundant

* **Identifier:** redundant_nil_coalescing
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
var myVar: Int?; myVar ?? 0
```

## Triggering Examples

```swift
var myVar: Int? = nil; myVar ↓?? nil
```