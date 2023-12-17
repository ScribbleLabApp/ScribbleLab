# Explicit ACL

All declarations should specify Access Control Level keywords explicitly

* **Identifier:** explicit_acl
* **Enabled by default:** No
* **Supports autocorrection:** No
* **Kind:** idiomatic
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
internal enum A {}
```

```swift
public final class B {}
```

```swift
private struct C {}
```

```swift
internal enum A {
 internal enum B {}
}
```

```swift
internal final class Foo {}
```

```swift
internal
class Foo {
  private let bar = 5
}
```

```swift
internal func a() { let a =  }
```

```swift
private func a() { func innerFunction() { } }
```

```swift
private enum Foo { enum Bar { } }
```

```swift
private struct C { let d = 5 }
```

```swift
internal protocol A {
  func b()
}
```

```swift
internal protocol A {
  var b: Int
}
```

```swift
internal class A { deinit {} }
```

```swift
extension A: Equatable {}
```

```swift
extension A {}
```

```swift
extension Foo {
    internal func bar() {}
}
```

```swift
internal enum Foo {
    case bar
}
```

```swift
extension Foo {
    public var isValid: Bool {
        let result = true
        return result
    }
}
```

```swift
extension Foo {
    private var isValid: Bool {
        get {
            return true
        }
        set(newValue) {
            print(newValue)
        }
    }
}
```

## Triggering Examples

```swift
↓enum A {}
```

```swift
final ↓class B {}
```

```swift
internal struct C { ↓let d = 5 }
```

```swift
public struct C { ↓let d = 5 }
```

```swift
func a() {}
```

```swift
internal let a = 0
↓func b() {}
```

```swift
extension Foo {
    ↓func bar() {}
}
```