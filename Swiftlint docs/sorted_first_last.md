# Min or Max over Sorted First or Last

Prefer using `min()` or `max()` over `sorted().first` or `sorted().last`

* **Identifier:** sorted_first_last
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
let min = myList.min()
```

```swift
let min = myList.min(by: { $0 < $1 })
```

```swift
let min = myList.min(by: >)
```

```swift
let max = myList.max()
```

```swift
let max = myList.max(by: { $0 < $1 })
```

```swift
let message = messages.sorted(byKeyPath: #keyPath(Message.timestamp)).last
```

```swift
let message = messages.sorted(byKeyPath: "timestamp", ascending: false).first
```

```swift
myList.sorted().firstIndex(of: key)
```

```swift
myList.sorted().lastIndex(of: key)
```

```swift
myList.sorted().firstIndex(where: someFunction)
```

```swift
myList.sorted().lastIndex(where: someFunction)
```

```swift
myList.sorted().firstIndex { $0 == key }
```

```swift
myList.sorted().lastIndex { $0 == key }
```

```swift
myList.sorted().first(where: someFunction)
```

```swift
myList.sorted().last(where: someFunction)
```

```swift
myList.sorted().first { $0 == key }
```

```swift
myList.sorted().last { $0 == key }
```

## Triggering Examples

```swift
↓myList.sorted().first
```

```swift
↓myList.sorted(by: { $0.description < $1.description }).first
```

```swift
↓myList.sorted(by: >).first
```

```swift
↓myList.map { $0 + 1 }.sorted().first
```

```swift
↓myList.sorted(by: someFunction).first
```

```swift
↓myList.map { $0 + 1 }.sorted { $0.description < $1.description }.first
```

```swift
↓myList.sorted().last
```

```swift
↓myList.sorted().last?.something()
```

```swift
↓myList.sorted(by: { $0.description < $1.description }).last
```

```swift
↓myList.map { $0 + 1 }.sorted().last
```

```swift
↓myList.sorted(by: someFunction).last
```

```swift
↓myList.map { $0 + 1 }.sorted { $0.description < $1.description }.last
```

```swift
↓myList.map { $0 + 1 }.sorted { $0.first < $1.first }.last
```