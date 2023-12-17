# Closure Parameter Position

Closure parameters should be on the same line as opening brace

* **Identifier:** closure_parameter_position
* **Enabled by default:** Yes
* **Supports autocorrection:** No
* **Kind:** style
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
[1, 2].map { $0 + 1 }
```

```swift
[1, 2].map({ $0 + 1 })
```

```swift
[1, 2].map { number in
 number + 1 
}
```

```swift
[1, 2].map { number -> Int in
 number + 1 
}
```

```swift
[1, 2].map { (number: Int) -> Int in
 number + 1 
}
```

```swift
[1, 2].map { [weak self] number in
 number + 1 
}
```

```swift
[1, 2].something(closure: { number in
 number + 1 
})
```

```swift
let isEmpty = [1, 2].isEmpty()
```

```swift
rlmConfiguration.migrationBlock.map { rlmMigration in
    return { migration, schemaVersion in
        rlmMigration(migration.rlmMigration, schemaVersion)
    }
}
```

```swift
let mediaView: UIView = { [weak self] index in
   return UIView()
}(index)
```

## Triggering Examples

```swift
[1, 2].map {
    ↓number in
    number + 1
}
```

```swift
[1, 2].map {
    ↓number -> Int in
    number + 1
}
```

```swift
[1, 2].map {
    (↓number: Int) -> Int in
    number + 1
}
```

```swift
[1, 2].map {
    [weak ↓self] ↓number in
    number + 1
}
```

```swift
[1, 2].map { [weak self]
    ↓number in
    number + 1
}
```

```swift
[1, 2].map({
    ↓number in
    number + 1
})
```

```swift
[1, 2].something(closure: {
    ↓number in
    number + 1
})
```

```swift
[1, 2].reduce(0) {
    ↓sum, ↓number in
    number + sum
})
```

```swift
f.completionHandler = {
    ↓thing in
    doStuff()
}
```

```swift
foo {
    [weak ↓self] in
    self?.bar()
}
```