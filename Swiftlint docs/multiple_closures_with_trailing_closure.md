# Multiple Closures with Trailing Closure

Trailing closure syntax should not be used when passing more than one closure argument

* **Identifier:** multiple_closures_with_trailing_closure
* **Enabled by default:** Yes
* **Supports autocorrection:** No
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
foo.map { $0 + 1 }
```

```swift
foo.reduce(0) { $0 + $1 }
```

```swift
if let foo = bar.map({ $0 + 1 }) {

}
```

```swift
foo.something(param1: { $0 }, param2: { $0 + 1 })
```

```swift
UIView.animate(withDuration: 1.0) {
    someView.alpha = 0.0
}
```

```swift
foo.method { print(0) } arg2: { print(1) }
```

```swift
foo.methodWithParenArgs((0, 1), arg2: (0, 1, 2)) { $0 } arg4: { $0 }
```

## Triggering Examples

```swift
foo.something(param1: { $0 }) ↓{ $0 + 1 }
```

```swift
UIView.animate(withDuration: 1.0, animations: {
    someView.alpha = 0.0
}) ↓{ _ in
    someView.removeFromSuperview()
}
```

```swift
foo.multipleTrailing(arg1: { $0 }) { $0 } arg3: { $0 }
```

```swift
foo.methodWithParenArgs(param1: { $0 }, param2: (0, 1), (0, 1)) { $0 }
```