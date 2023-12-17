# Local Doc Comment

Prefer regular comments over doc comments in local scopes

* **Identifier:** local_doc_comment
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
func foo() {
  // Local scope documentation should use normal comments.
  print("foo")
}
```

```swift
/// My great property
var myGreatProperty: String!
```

```swift
/// Look here for more info: https://github.com.
var myGreatProperty: String!
```

```swift
/// Look here for more info:
/// https://github.com.
var myGreatProperty: String!
```

## Triggering Examples

```swift
func foo() {
  ↓/// Docstring inside a function declaration
  print("foo")
}
```