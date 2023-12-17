# Legacy Random

Prefer using `type.random(in:)` over legacy functions

* **Identifier:** legacy_random
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
Int.random(in: 0..<10)
```

```swift
Double.random(in: 8.6...111.34)
```

```swift
Float.random(in: 0 ..< 1)
```

## Triggering Examples

```swift
↓arc4random()
```

```swift
↓arc4random_uniform(83)
```

```swift
↓drand48()
```