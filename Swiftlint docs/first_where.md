# First Where

Prefer using `.first(where:)` over `.filter { }.first` in collections

* **Identifier:** first_where
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
kinds.filter(excludingKinds.contains).isEmpty && kinds.first == .identifier
```

```swift
myList.first(where: { $0 % 2 == 0 })
```

```swift
match(pattern: pattern).filter { $0.first == .identifier }
```

```swift
(myList.filter { $0 == 1 }.suffix(2)).first
```

```swift
collection.filter("stringCol = '3'").first
```

```swift
realm?.objects(User.self).filter(NSPredicate(format: "email ==[c] %@", email)).first
```

```swift
if let pause = timeTracker.pauses.filter("beginDate < %@", beginDate).first { print(pause) }
```

## Triggering Examples

```swift
↓myList.filter { $0 % 2 == 0 }.first
```

```swift
↓myList.filter({ $0 % 2 == 0 }).first
```

```swift
↓myList.map { $0 + 1 }.filter({ $0 % 2 == 0 }).first
```

```swift
↓myList.map { $0 + 1 }.filter({ $0 % 2 == 0 }).first?.something()
```

```swift
↓myList.filter(someFunction).first
```

```swift
↓myList.filter({ $0 % 2 == 0 })
.first
```

```swift
(↓myList.filter { $0 == 1 }).first
```

```swift
↓myListOfDict.filter { dict in dict["1"] }.first
```

```swift
↓myListOfDict.filter { $0["someString"] }.first
```