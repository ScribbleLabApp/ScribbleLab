# Inert Defer

If defer is at the end of its parent scope, it will be executed right where it is anyway

* **Identifier:** inert_defer
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
func example3() {
    defer { /* deferred code */ }

    print("other code")
}
```

```swift
func example4() {
    if condition {
        defer { /* deferred code */ }
        print("other code")
    }
}
```

## Triggering Examples

```swift
func example0() {
    ↓defer { /* deferred code */ }
}
```

```swift
func example1() {
    ↓defer { /* deferred code */ }
    // comment
}
```

```swift
func example2() {
    if condition {
        ↓defer { /* deferred code */ }
        // comment
    }
}
```