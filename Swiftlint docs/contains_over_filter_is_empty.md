# Contains over Filter is Empty

Prefer `contains` over using `filter(where:).isEmpty`

* **Identifier:** contains_over_filter_is_empty
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
let result = myList.filter(where: { $0 % 2 == 0 }).count > 1
```

```swift
let result = myList.filter { $0 % 2 == 0 }.count > 1
```

```swift
let result = myList.filter(where: { $0 % 2 == 0 }).count == 1
```

```swift
let result = myList.filter { $0 % 2 == 0 }.count == 1
```

```swift
let result = myList.filter(where: { $0 % 2 == 0 }).count != 1
```

```swift
let result = myList.filter { $0 % 2 == 0 }.count != 1
```

```swift
let result = myList.contains(where: { $0 % 2 == 0 })
```

```swift
let result = !myList.contains(where: { $0 % 2 == 0 })
```

```swift
let result = myList.contains(10)
```

## Triggering Examples

```swift
let result = ↓myList.filter(where: { $0 % 2 == 0 }).isEmpty
```

```swift
let result = !↓myList.filter(where: { $0 % 2 == 0 }).isEmpty
```

```swift
let result = ↓myList.filter { $0 % 2 == 0 }.isEmpty
```

```swift
let result = ↓myList.filter(where: someFunction).isEmpty
```