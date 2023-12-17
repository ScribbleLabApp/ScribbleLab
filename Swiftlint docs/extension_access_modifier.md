# Extension Access Modifier

Prefer to use extension access modifiers

* **Identifier:** extension_access_modifier
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
extension Foo: SomeProtocol {
  public var bar: Int { return 1 }
}
```

```swift
extension Foo {
  private var bar: Int { return 1 }
  public var baz: Int { return 1 }
}
```

```swift
extension Foo {
  private var bar: Int { return 1 }
  public func baz() {}
}
```

```swift
extension Foo {
  var bar: Int { return 1 }
  var baz: Int { return 1 }
}
```

```swift
public extension Foo {
  var bar: Int { return 1 }
  var baz: Int { return 1 }
}
```

```swift
extension Foo {
  private bar: Int { return 1 }
  private baz: Int { return 1 }
}
```

```swift
extension Foo {
  open bar: Int { return 1 }
  open baz: Int { return 1 }
}
```

```swift
extension Foo {
    func setup() {}
    public func update() {}
}
```

## Triggering Examples

```swift
↓extension Foo {
   public var bar: Int { return 1 }
   public var baz: Int { return 1 }
}
```

```swift
↓extension Foo {
   public var bar: Int { return 1 }
   public func baz() {}
}
```

```swift
public extension Foo {
   public ↓func bar() {}
   public ↓func baz() {}
}
```

```swift
↓extension Foo {
   public var bar: Int {
      let value = 1
      return value
   }

   public var baz: Int { return 1 }
}
```