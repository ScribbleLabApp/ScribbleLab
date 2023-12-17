# Class Declaration in Final Class

Class methods and properties in final classes should themselves be final, just as if the declarations
are private. In both cases, they cannot be overriden. Using `final class` or `static` makes this explicit.

* **Identifier:** non_overridable_class_declaration
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
  final_class_modifier
  </td>
  <td>
  final class
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
final class C {
    final class var b: Bool { true }
    final class func f() {}
}
```

```swift
class C {
    final class var b: Bool { true }
    final class func f() {}
}
```

```swift
class C {
    class var b: Bool { true }
    class func f() {}
}
```

```swift
class C {
    static var b: Bool { true }
    static func f() {}
}
```

```swift
final class C {
    static var b: Bool { true }
    static func f() {}
}
```

```swift
final class C {
    class D {
        class var b: Bool { true }
        class func f() {}
    }
}
```

## Triggering Examples

```swift
final class C {
    ↓class var b: Bool { true }
    ↓class func f() {}
}
```

```swift
class C {
    final class D {
        ↓class var b: Bool { true }
        ↓class func f() {}
    }
}
```

```swift
class C {
    private ↓class var b: Bool { true }
    private ↓class func f() {}
}
```