# Compiler Protocol Init

The initializers declared in compiler protocols such as `ExpressibleByArrayLiteral` shouldn't be called directly.

* **Identifier:** compiler_protocol_init
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
let set: Set<Int> = [1, 2]
```

```swift
let set = Set(array)
```

## Triggering Examples

```swift
let set = ↓Set(arrayLiteral: 1, 2)
```

```swift
let set = ↓Set (arrayLiteral: 1, 2)
```

```swift
let set = ↓Set.init(arrayLiteral: 1, 2)
```

```swift
let set = ↓Set.init(arrayLiteral : 1, 2)
```