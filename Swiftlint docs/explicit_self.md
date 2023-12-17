# Explicit Self

Instance variables and functions should be explicitly accessed with 'self.'

* **Identifier:** explicit_self
* **Enabled by default:** No
* **Supports autocorrection:** Yes
* **Kind:** style
* **Analyzer rule:** Yes
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
struct A {
    func f1() {}
    func f2() {
        self.f1()
    }
}
```

```swift
struct A {
    let p1: Int
    func f1() {
        _ = self.p1
    }
}
```

```swift
@propertyWrapper
struct Wrapper<Value> {
    let wrappedValue: Value
    var projectedValue: [Value] {
        [self.wrappedValue]
    }
}
struct A {
    @Wrapper var p1: Int
    func f1() {
        self.$p1
        self._p1
    }
}
func f1() {
    A(p1: 10).$p1
}
```

## Triggering Examples

```swift
struct A {
    func f1() {}
    func f2() {
        ↓f1()
    }
}
```

```swift
struct A {
    let p1: Int
    func f1() {
        _ = ↓p1
    }
}
```

```swift
struct A {
    func f1(a b: Int) {}
    func f2() {
        ↓f1(a: 0)
    }
}
```

```swift
@propertyWrapper
struct Wrapper<Value> {
    let wrappedValue: Value
    var projectedValue: [Value] {
        [self.wrappedValue]
    }
}
struct A {
    @Wrapper var p1: Int
    func f1() {
        ↓$p1
        ↓_p1
    }
}
func f1() {
    A(p1: 10).$p1
}
```