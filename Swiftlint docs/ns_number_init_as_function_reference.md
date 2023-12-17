# NSNumber Init as Function Reference

Passing `NSNumber.init` or `NSDecimalNumber.init` as a function reference is dangerous as it can cause the wrong initializer to be used, causing crashes; use `.init(value:)` instead

* **Identifier:** ns_number_init_as_function_reference
* **Enabled by default:** Yes
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
[0, 0.2].map(NSNumber.init(value:))
```

```swift
let value = NSNumber.init(value: 0.0)
```

```swift
[0, 0.2].map { NSNumber(value: $0) }
```

```swift
[0, 0.2].map(NSDecimalNumber.init(value:))
```

```swift
[0, 0.2].map { NSDecimalNumber(value: $0) }
```

## Triggering Examples

```swift
[0, 0.2].map(↓NSNumber.init)
```

```swift
[0, 0.2].map(↓NSDecimalNumber.init)
```