# Last Where

Prefer using `.last(where:)` over `.filter { }.last` in collections

* **Identifier:** last_where
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
kinds.filter(excludingKinds.contains).isEmpty && kinds.last == .identifier
```

```swift
myList.last(where: { $0 % 2 == 0 })
```

```swift
match(pattern: pattern).filter { $0.last == .identifier }
```

```swift
(myList.filter { $0 == 1 }.suffix(2)).last
```

```swift
collection.filter("stringCol = '3'").last
```

## Triggering Examples

```swift
↓myList.filter { $0 % 2 == 0 }.last
```

```swift
↓myList.filter({ $0 % 2 == 0 }).last
```

```swift
↓myList.map { $0 + 1 }.filter({ $0 % 2 == 0 }).last
```

```swift
↓myList.map { $0 + 1 }.filter({ $0 % 2 == 0 }).last?.something()
```

```swift
↓myList.filter(someFunction).last
```

```swift
↓myList.filter({ $0 % 2 == 0 })
.last
```

```swift
(↓myList.filter { $0 == 1 }).last
```