# Invalid SwiftLint Command

swiftlint command is invalid

* **Identifier:** invalid_swiftlint_command
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
// swiftlint:disable unused_import
```

```swift
// swiftlint:enable unused_import
```

```swift
// swiftlint:disable:next unused_import
```

```swift
// swiftlint:disable:previous unused_import
```

```swift
// swiftlint:disable:this unused_import
```

```swift
//swiftlint:disable:this unused_import
```

## Triggering Examples

```swift
// ↓swiftlint:
```

```swift
// ↓swiftlint: 
```

```swift
// ↓swiftlint::
```

```swift
// ↓swiftlint:: 
```

```swift
// ↓swiftlint:disable
```

```swift
// ↓swiftlint:dissable unused_import
```

```swift
// ↓swiftlint:enaaaable unused_import
```

```swift
// ↓swiftlint:disable:nxt unused_import
```

```swift
// ↓swiftlint:enable:prevus unused_import
```

```swift
// ↓swiftlint:enable:ths unused_import
```

```swift
// ↓swiftlint:enable
```

```swift
// ↓swiftlint:enable:
```

```swift
// ↓swiftlint:enable: 
```

```swift
// ↓swiftlint:disable: unused_import
```

```swift
// s↓swiftlint:disable unused_import
```