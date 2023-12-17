# Prefer Zero Over Explicit Init

Prefer `.zero` over explicit init with zero parameters (e.g. `CGPoint(x: 0, y: 0)`)

* **Identifier:** prefer_zero_over_explicit_init
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
CGRect(x: 0, y: 0, width: 0, height: 1)
```

```swift
CGPoint(x: 0, y: -1)
```

```swift
CGSize(width: 2, height: 4)
```

```swift
CGVector(dx: -5, dy: 0)
```

```swift
UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
```

## Triggering Examples

```swift
↓CGPoint(x: 0, y: 0)
```

```swift
↓CGPoint(x: 0.000000, y: 0)
```

```swift
↓CGPoint(x: 0.000000, y: 0.000)
```

```swift
↓CGRect(x: 0, y: 0, width: 0, height: 0)
```

```swift
↓CGSize(width: 0, height: 0)
```

```swift
↓CGVector(dx: 0, dy: 0)
```

```swift
↓UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
```