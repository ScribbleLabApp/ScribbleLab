# Unused Closure Parameter

Unused parameter in a closure should be replaced with _

* **Identifier:** unused_closure_parameter
* **Enabled by default:** Yes
* **Supports autocorrection:** Yes
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
[1, 2].map { _ in
 3 
}
```

```swift
[1, 2].something { number, idx in
 return number * idx
}
```

```swift
let isEmpty = [1, 2].isEmpty()
```

```swift
violations.sorted(by: { lhs, rhs in 
 return lhs.location > rhs.location
})
```

```swift
rlmConfiguration.migrationBlock.map { rlmMigration in
    return { migration, schemaVersion in
        rlmMigration(migration.rlmMigration, schemaVersion)
    }
}
```

```swift
genericsFunc { (a: Type, b) in
    a + b
}
```

```swift
var label: UILabel = { (lbl: UILabel) -> UILabel in
    lbl.backgroundColor = .red
    return lbl
}(UILabel())
```

```swift
hoge(arg: num) { num in
    return num
}
```

```swift
({ (manager: FileManager) in
  print(manager)
})(FileManager.default)
```

```swift
withPostSideEffect { input in
    if true { print("\(input)") }
}
```

```swift
viewModel?.profileImage.didSet(weak: self) { (self, profileImage) in
    self.profileImageView.image = profileImage
}
```

```swift
let failure: Failure = { task, error in
    observer.sendFailed(error, task)
}
```

```swift
List($names) { $name in
    Text(name)
}
```

```swift
List($names) { $name in
    TextField($name)
}
```

```swift
_ = ["a"].filter { `class` in `class`.hasPrefix("a") }
```

```swift
let closure: (Int) -> Void = { `foo` in _ = foo }
```

```swift
let closure: (Int) -> Void = { foo in _ = `foo` }
```

## Triggering Examples

```swift
[1, 2].map { ↓number in
 return 3 }
```

```swift
[1, 2].map { ↓number in
 return numberWithSuffix }
```

```swift
[1, 2].map { ↓number in
 return 3 // number }
```

```swift
[1, 2].map { ↓number in
 return 3 "number" }
```

```swift
[1, 2].something { number, ↓idx in
 return number }
```

```swift
genericsFunc { (↓number: TypeA, idx: TypeB) in return idx }
```

```swift
let c: (Int) -> Void = { foo in _ = .foo }
```

```swift
hoge(arg: num) { ↓num in
}
```

```swift
fooFunc { ↓아 in }
```

```swift
func foo () {
 bar { ↓number in return 3 }
```

```swift
viewModel?.profileImage.didSet(weak: self) { (↓self, profileImage) in
    profileImageView.image = profileImage
}
```

```swift
let failure: Failure = { ↓task, error in
    observer.sendFailed(error)
}
```

```swift
List($names) { ↓$name in
    Text("Foo")
}
```

```swift
let class1 = "a"
_ = ["a"].filter { ↓`class` in `class1`.hasPrefix("a") }
```