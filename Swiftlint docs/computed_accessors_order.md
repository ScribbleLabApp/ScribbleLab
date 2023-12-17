# Computed Accessors Order

Getter and setters in computed properties and subscripts should be in a consistent order.

* **Identifier:** computed_accessors_order
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
  <tr>
  <td>
  order
  </td>
  <td>
  get_set
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
class Foo {
    var foo: Int {
        get { return 3 }
        set { _abc = newValue }
    }
}
```

```swift
class Foo {
    var foo: Int {
        return 20
    }
}
```

```swift
class Foo {
    static var foo: Int {
        return 20
    }
}
```

```swift
class Foo {
    static var foo: Int {
        get { return 3 }
        set { _abc = newValue }
    }
}
```

```swift
class Foo {
    var foo: Int
}
```

```swift
class Foo {
    var foo: Int {
        return getValueFromDisk()
    }
}
```

```swift
class Foo {
    var foo: String {
        return "get"
    }
}
```

```swift
protocol Foo {
    var foo: Int { get }
```

```swift
protocol Foo {
    var foo: Int { get set }
}
```

```swift
protocol Foo {
    var foo: Int { set get }
```

```swift
class Foo {
    var foo: Int {
        struct Bar {
            var bar: Int {
                get { return 1 }
                set { _ = newValue }
            }
        }

        return Bar().bar
    }
}
```

```swift
var _objCTaggedPointerBits: UInt {
    @inline(__always) get { return 0 }
    set { print(newValue) }
}
```

```swift
var next: Int? {
    mutating get {
        defer { self.count += 1 }
        return self.count
    }
    set {
        self.count = newValue
    }
}
```

```swift
extension Foo {
    var bar: Bool {
        get { _bar }
        set { self._bar = newValue }
    }
}
```

```swift
extension Foo {
    var bar: Bool {
        get { _bar }
        set(newValue) { self._bar = newValue }
    }
}
```

```swift
extension Reactive where Base: UITapGestureRecognizer {
    var tapped: CocoaAction<Base>? {
        get {
            return associatedAction.withValue { $0.flatMap { $0.action } }
        }
        nonmutating set {
            setAction(newValue)
        }
    }
}
```

```swift
extension Test {
    var foo: Bool {
        get {
            bar?.boolValue ?? true // Comment mentioning word set which triggers violation
        }
        set {
            bar = NSNumber(value: newValue as Bool)
        }
    }
}
```

```swift
class Foo {
    subscript(i: Int) -> Int {
        return 20
    }
}
```

```swift
class Foo {
    subscript(i: Int) -> Int {
        get { return 3 }
        set { _abc = newValue }
    }
}
```

```swift
protocol Foo {
    subscript(i: Int) -> Int { get }
}
```

```swift
protocol Foo {
    subscript(i: Int) -> Int { get set }
}
```

```swift
protocol Foo {
    subscript(i: Int) -> Int { set get }
}
```

## Triggering Examples

```swift
class Foo {
    var foo: Int {
        ↓set {
            print(newValue)
        }
        get {
            return 20
        }
    }
}
```

```swift
class Foo {
    static var foo: Int {
        ↓set {
            print(newValue)
        }
        get {
            return 20
        }
    }
}
```

```swift
var foo: Int {
    ↓set { print(newValue) }
    get { return 20 }
}
```

```swift
extension Foo {
    var bar: Bool {
        ↓set { print(bar) }
        get { _bar }
    }
}
```

```swift
class Foo {
    var foo: Int {
        ↓set {
            print(newValue)
        }
        mutating get {
            return 20
        }
    }
}
```

```swift
class Foo {
    subscript(i: Int) -> Int {
        ↓set {
            print(i)
        }
        get {
            return 20
        }
    }
}
```