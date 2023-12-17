# Implicit Return

Prefer implicit returns in closures, functions and getters

* **Identifier:** implicit_return
* **Enabled by default:** No
* **Supports autocorrection:** Yes
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
  <tr>
  <td>
  included
  </td>
  <td>
  [closure, function, getter, initializer, subscript]
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
foo.map { $0 + 1 }
```

```swift
foo.map({ $0 + 1 })
```

```swift
foo.map { value in value + 1 }
```

```swift
[1, 2].first(where: {
    true
})
```

```swift
func foo() -> Int {
    0
}
```

```swift
class Foo {
    func foo() -> Int { 0 }
}
```

```swift
func fetch() -> Data? {
    do {
        return try loadData()
    } catch {
        return nil
    }
}
```

```swift
func f() -> Int {
    let i = 4
    return i
}
```

```swift
func f() -> Int {
    return 3
    let i = 2
}
```

```swift
func f() -> Int {
    return g()
    func g() -> Int { 4 }
}
```

```swift
var foo: Bool { true }
```

```swift
class Foo {
    var bar: Int {
        get {
            0
        }
    }
}
```

```swift
class Foo {
    static var bar: Int {
        0
    }
}
```

```swift
class C {
    let i: Int
    init(i: Int) {
        if i < 3 {
            self.i = 1
            return
        }
        self.i = 2
    }
}
```

```swift
class C {
    init?() {
        let i = 1
        return nil
    }
}
```

```swift
class C {
    subscript(i: Int) -> Int {
        let res = i
        return res
    }
}
```

## Triggering Examples

```swift
foo.map { value in
    ↓return value + 1
}
```

```swift
foo.map {
    ↓return $0 + 1
}
```

```swift
foo.map({ ↓return $0 + 1})
```

```swift
[1, 2].first(where: {
    ↓return true
})
```

```swift
func foo() -> Int {
    ↓return 0
}
```

```swift
class Foo {
    func foo() -> Int { ↓return 0 }
}
```

```swift
func f() { ↓return }
```

```swift
var foo: Bool { ↓return true }
```

```swift
class Foo {
    var bar: Int {
        get {
            ↓return 0
        }
    }
}
```

```swift
class Foo {
    static var bar: Int {
        ↓return 0
    }
}
```

```swift
class C {
    init() {
        ↓return
    }
}
```

```swift
class C {
    init?() {
        ↓return nil
    }
}
```

```swift
class C {
    subscript(i: Int) -> Int {
        ↓return i
    }
}
```