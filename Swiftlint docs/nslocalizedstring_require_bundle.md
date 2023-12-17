# NSLocalizedString Require Bundle

Calls to NSLocalizedString should specify the bundle which contains the strings file

* **Identifier:** nslocalizedstring_require_bundle
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
NSLocalizedString("someKey", bundle: .main, comment: "test")
```

```swift
NSLocalizedString("someKey", tableName: "a",
                  bundle: Bundle(for: A.self),
                  comment: "test")
```

```swift
NSLocalizedString("someKey", tableName: "xyz",
                  bundle: someBundle, value: "test"
                  comment: "test")
```

```swift
arbitraryFunctionCall("something")
```

## Triggering Examples

```swift
↓NSLocalizedString("someKey", comment: "test")
```

```swift
↓NSLocalizedString("someKey", tableName: "a", comment: "test")
```

```swift
↓NSLocalizedString("someKey", tableName: "xyz",
                  value: "test", comment: "test")
```