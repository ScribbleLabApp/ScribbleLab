# Prefer Self Type Over Type of Self

Prefer `Self` over `type(of: self)` when accessing properties or calling methods

* **Identifier:** prefer_self_type_over_type_of_self
* **Enabled by default:** No
* **Supports autocorrection:** Yes
* **Kind:** style
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.1.0
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
class Foo {
    func bar() {
        Self.baz()
    }
}
```

```swift
class Foo {
    func bar() {
        print(Self.baz)
    }
}
```

```swift
class A {
    func foo(param: B) {
        type(of: param).bar()
    }
}
```

```swift
class A {
    func foo() {
        print(type(of: self))
    }
}
```

## Triggering Examples

```swift
class Foo {
    func bar() {
        ↓type(of: self).baz()
    }
}
```

```swift
class Foo {
    func bar() {
        print(↓type(of: self).baz)
    }
}
```

```swift
class Foo {
    func bar() {
        print(↓Swift.type(of: self).baz)
    }
}
```