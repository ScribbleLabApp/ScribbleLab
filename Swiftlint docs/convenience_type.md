# Convenience Type

Types used for hosting only static members should be implemented as a caseless enum to avoid instantiation

* **Identifier:** convenience_type
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
enum Math { // enum
  public static let pi = 3.14
}
```

```swift
// class with inheritance
class MathViewController: UIViewController {
  public static let pi = 3.14
}
```

```swift
@objc class Math: NSObject { // class visible to Obj-C
  public static let pi = 3.14
}
```

```swift
struct Math { // type with non-static declarations
  public static let pi = 3.14
  public let randomNumber = 2
}
```

```swift
class DummyClass {}
```

```swift
class Foo: NSObject { // class with Obj-C class property
    class @objc let foo = 1
}
```

```swift
class Foo: NSObject { // class with Obj-C static property
    static @objc let foo = 1
}
```

```swift
class Foo { // @objc class func can't exist on an enum
   @objc class func foo() {}
}
```

```swift
class Foo { // @objc static func can't exist on an enum
   @objc static func foo() {}
}
```

```swift
@objcMembers class Foo { // @objc static func can't exist on an enum
   static func foo() {}
}
```

```swift
final class Foo { // final class, but @objc class func can't exist on an enum
   @objc class func foo() {}
}
```

```swift
final class Foo { // final class, but @objc static func can't exist on an enum
   @objc static func foo() {}
}
```

```swift
@globalActor actor MyActor {
  static let shared = MyActor()
}
```

## Triggering Examples

```swift
↓struct Math {
  public static let pi = 3.14
}
```

```swift
↓struct Math {
  public static let pi = 3.14
  @available(*, unavailable) init() {}
}
```

```swift
final ↓class Foo { // final class can't be inherited
    class let foo = 1
}
```

```swift
↓class Foo {
    class let foo = 1
}
```

```swift
↓class Foo {
    final class let foo = 1
}
```

```swift
↓class SomeClass {
    static func foo() {}
}
```