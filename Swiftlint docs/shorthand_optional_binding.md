# Shorthand Optional Binding

Use shorthand syntax for optional binding

* **Identifier:** shorthand_optional_binding
* **Enabled by default:** No
* **Supports autocorrection:** Yes
* **Kind:** idiomatic
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.7.0
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
    if let i {}
    if let i = a {}
    guard let i = f() else {}
    if var i = i() {}
    if let i = i as? Foo {}
    guard let `self` = self else {}
    while var i { i = nil }
```

## Triggering Examples

```swift
    if ↓let i = i {}
    if ↓let self = self {}
    if ↓var `self` = `self` {}
    if i > 0, ↓let j = j {}
    if ↓let i = i, ↓var j = j {}
```

```swift
    guard ↓let i = i else {}
    guard ↓let self = self else {}
    guard ↓var `self` = `self` else {}
    guard i > 0, ↓let j = j else {}
    guard ↓let i = i, ↓var j = j else {}
```

```swift
    while ↓var i = i { i = nil }
```