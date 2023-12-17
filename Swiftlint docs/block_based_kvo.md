# Block Based KVO

Prefer the new block based KVO API with keypaths when using Swift 3.2 or later

* **Identifier:** block_based_kvo
* **Enabled by default:** Yes
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
let observer = foo.observe(\.value, options: [.new]) { (foo, change) in
   print(change.newValue)
}
```

## Triggering Examples

```swift
class Foo: NSObject {
  override ↓func observeValue(forKeyPath keyPath: String?, of object: Any?,
                              change: [NSKeyValueChangeKey : Any]?,
                              context: UnsafeMutableRawPointer?) {}
}
```

```swift
class Foo: NSObject {
  override ↓func observeValue(forKeyPath keyPath: String?, of object: Any?,
                              change: Dictionary<NSKeyValueChangeKey, Any>?,
                              context: UnsafeMutableRawPointer?) {}
}
```