# No Extension Access Modifier

Prefer not to use extension access modifiers

* **Identifier:** no_extension_access_modifier
* **Enabled by default:** No
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
  error
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
extension String {}
```

```swift


 extension String {}
```

## Triggering Examples

```swift
↓private extension String {}
```

```swift
↓public 
 extension String {}
```

```swift
↓open extension String {}
```

```swift
↓internal extension String {}
```

```swift
↓fileprivate extension String {}
```