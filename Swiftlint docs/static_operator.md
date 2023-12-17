# Static Operator

Operators should be declared as static functions, not free functions

* **Identifier:** static_operator
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
  warning
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
class A: Equatable {
  static func == (lhs: A, rhs: A) -> Bool {
    return false
  }
```

```swift
class A<T>: Equatable {
    static func == <T>(lhs: A<T>, rhs: A<T>) -> Bool {
        return false
    }
```

```swift
public extension Array where Element == Rule {
  static func == (lhs: Array, rhs: Array) -> Bool {
    if lhs.count != rhs.count { return false }
    return !zip(lhs, rhs).contains { !$0.0.isEqualTo($0.1) }
  }
}
```

```swift
private extension Optional where Wrapped: Comparable {
  static func < (lhs: Optional, rhs: Optional) -> Bool {
    switch (lhs, rhs) {
    case let (lhs?, rhs?):
      return lhs < rhs
    case (nil, _?):
      return true
    default:
      return false
    }
  }
}
```

## Triggering Examples

```swift
↓func == (lhs: A, rhs: A) -> Bool {
  return false
}
```

```swift
↓func == <T>(lhs: A<T>, rhs: A<T>) -> Bool {
  return false
}
```

```swift
↓func == (lhs: [Rule], rhs: [Rule]) -> Bool {
  if lhs.count != rhs.count { return false }
  return !zip(lhs, rhs).contains { !$0.0.isEqualTo($0.1) }
}
```

```swift
private ↓func < <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (lhs?, rhs?):
    return lhs < rhs
  case (nil, _?):
    return true
  default:
    return false
  }
}
```