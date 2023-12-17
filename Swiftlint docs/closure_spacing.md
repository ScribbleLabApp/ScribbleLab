# Closure Spacing

Closure expressions should have a single space inside each brace

* **Identifier:** closure_spacing
* **Enabled by default:** No
* **Supports autocorrection:** Yes
* **Kind:** style
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
[].map ({ $0.description })
```

```swift
[].filter { $0.contains(location) }
```

```swift
extension UITableViewCell: ReusableView { }
```

```swift
extension UITableViewCell: ReusableView {}
```

## Triggering Examples

```swift
[].filter↓{ $0.contains(location) }
```

```swift
[].filter(↓{$0.contains(location)})
```

```swift
[].map(↓{$0})
```

```swift
(↓{each in return result.contains(where: ↓{e in return e}) }).count
```

```swift
filter ↓{ sorted ↓{ $0 < $1}}
```