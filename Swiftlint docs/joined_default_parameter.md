# Joined Default Parameter

Discouraged explicit usage of the default separator

* **Identifier:** joined_default_parameter
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
let foo = bar.joined()
```

```swift
let foo = bar.joined(separator: ",")
```

```swift
let foo = bar.joined(separator: toto)
```

## Triggering Examples

```swift
let foo = bar.joined(↓separator: "")
```

```swift
let foo = bar.filter(toto)
             .joined(↓separator: ""),
```

```swift
func foo() -> String {
  return ["1", "2"].joined(↓separator: "")
}
```