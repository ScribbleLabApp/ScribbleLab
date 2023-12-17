# Flat Map over Map Reduce

Prefer `flatMap` over `map` followed by `reduce([], +)`

* **Identifier:** flatmap_over_map_reduce
* **Enabled by default:** No
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
let foo = bar.map { $0.count }.reduce(0, +)
```

```swift
let foo = bar.flatMap { $0.array }
```

## Triggering Examples

```swift
let foo = ↓bar.map { $0.array }.reduce([], +)
```