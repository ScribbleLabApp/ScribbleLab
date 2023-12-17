# Modifier Order

Modifier order should be consistent.

* **Identifier:** modifier_order
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
  preferred_modifier_order
  </td>
  <td>
  [override, acl, setterACL, dynamic, mutators, lazy, final, required, convenience, typeMethods, owned]
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
public class Foo {
   public required convenience init() {}
}
```

```swift
public class Foo {
   public static let bar = 42
}
```

```swift
public class Foo {
   public static var bar: Int {
       return
   }
}
```

```swift
public class Foo {
   public class var bar: Int {
       return 42
   }
}
```

```swift
public class Bar {
   public class var foo: String {
       return "foo"
   }
}
public class Foo: Bar {
   override public final class var foo: String {
       return "bar"
   }
}
```

```swift
open class Bar {
   public var foo: Int? {
       return 42
   }
}
open class Foo: Bar {
   override public var foo: Int? {
       return 43
   }
}
```

```swift
open class Bar {
   open class func foo() -> Int {
       return 42
   }
}
class Foo: Bar {
   override open class func foo() -> Int {
       return 43
   }
}
```

```swift
protocol Foo: class {}
class Bar {
    public private(set) weak var foo: Foo?
}
```

```swift
@objc
public final class Foo: NSObject {}
```

```swift
@objcMembers
public final class Foo: NSObject {}
```

```swift
@objc
override public private(set) weak var foo: Bar?
```

```swift
@objc
public final class Foo: NSObject {}
```

```swift
@objc
open final class Foo: NSObject {
   open weak var weakBar: NSString? = nil
}
```

```swift
public final class Foo {}
```

```swift
class Bar {
   func bar() {}
}
```

```swift
internal class Foo: Bar {
   override internal func bar() {}
}
```

```swift
public struct Foo {
   internal weak var weakBar: NSObject? = nil
}
```

```swift
class Foo {
   internal lazy var bar: String = "foo"
}
```

## Triggering Examples

```swift
class Foo {
   convenience required public init() {}
}
```

```swift
public class Foo {
   static public let bar = 42
}
```

```swift
public class Foo {
   static public var bar: Int {
       return 42
   }
}
```

```swift
public class Foo {
   class public var bar: Int {
       return 42
   }
}
```

```swift
public class RootFoo {
   class public var foo: String {
       return "foo"
   }
}
public class Foo: RootFoo {
   override final class public var foo: String
       return "bar"
   }
}
```

```swift
open class Bar {
   public var foo: Int? {
       return 42
   }
}
open class Foo: Bar {
    public override var foo: Int? {
       return 43
   }
}
```

```swift
protocol Foo: class {}
    class Bar {
        private(set) public weak var foo: Foo?
}
```

```swift
open class Bar {
   open class func foo() -> Int {
       return 42
   }
}
class Foo: Bar {
   class open override func foo() -> Int {
       return 43
   }
}
```

```swift
open class Bar {
   open class func foo() -> Int {
       return 42
   }
}
class Foo: Bar {
   open override class func foo() -> Int {
       return 43
   }
}
```

```swift
@objc
final public class Foo: NSObject {}
```

```swift
@objcMembers
final public class Foo: NSObject {}
```

```swift
@objc
final open class Foo: NSObject {
   weak open var weakBar: NSString? = nil
}
```

```swift
final public class Foo {}
```

```swift
internal class Foo: Bar {
   internal override func bar() {}
}
```

```swift
public struct Foo {
   weak internal var weakBar: NSObjetc? = nil
}
```

```swift
class Foo {
   lazy internal var bar: String = "foo"
}
```