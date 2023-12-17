# Reduce Boolean

Prefer using `.allSatisfy()` or `.contains()` over `reduce(true)` or `reduce(false)`.

* **Identifier:** reduce_boolean
* **Enabled by default:** Yes
* **Supports autocorrection:** No
* **Kind:** performance
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
nums.reduce(0) { $0.0 + $0.1 }
```

```swift
nums.reduce(0.0) { $0.0 + $0.1 }
```

```swift
nums.reduce(initial: true) { $0.0 && $0.1 == 3 }
```

## Triggering Examples

```swift
let allNines = nums.↓reduce(true) { $0.0 && $0.1 == 9 }
```

```swift
let anyNines = nums.↓reduce(false) { $0.0 || $0.1 == 9 }
```

```swift
let allValid = validators.↓reduce(true) { $0 && $1(input) }
```

```swift
let anyValid = validators.↓reduce(false) { $0 || $1(input) }
```

```swift
let allNines = nums.↓reduce(true, { $0.0 && $0.1 == 9 })
```

```swift
let anyNines = nums.↓reduce(false, { $0.0 || $0.1 == 9 })
```

```swift
let allValid = validators.↓reduce(true, { $0 && $1(input) })
```

```swift
let anyValid = validators.↓reduce(false, { $0 || $1(input) })
```

```swift
nums.reduce(into: true) { (r: inout Bool, s) in r = r && (s == 3) }
```