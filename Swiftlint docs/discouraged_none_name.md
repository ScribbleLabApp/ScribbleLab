# Discouraged None Name

Enum cases and static members named `none` are discouraged as they can conflict with `Optional<T>.none`.

* **Identifier:** discouraged_none_name
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
enum MyEnum {
    case nOne
}
```

```swift
enum MyEnum {
    case _none
}
```

```swift
enum MyEnum {
    case none_
}
```

```swift
enum MyEnum {
    case none(Any)
}
```

```swift
enum MyEnum {
    case nonenone
}
```

```swift
class MyClass {
    class var nonenone: MyClass { MyClass() }
}
```

```swift
class MyClass {
    static var nonenone = MyClass()
}
```

```swift
class MyClass {
    static let nonenone = MyClass()
}
```

```swift
struct MyStruct {
    static var nonenone = MyStruct()
}
```

```swift
struct MyStruct {
    static let nonenone = MyStruct()
}
```

```swift
struct MyStruct {
    let none = MyStruct()
}
```

```swift
struct MyStruct {
    var none = MyStruct()
}
```

```swift
class MyClass {
    let none = MyClass()
}
```

```swift
class MyClass {
    var none = MyClass()
}
```

## Triggering Examples

```swift
enum MyEnum {
    case ↓none
}
```

```swift
enum MyEnum {
    case a, ↓none
}
```

```swift
enum MyEnum {
    case ↓none, b
}
```

```swift
enum MyEnum {
    case a, ↓none, b
}
```

```swift
enum MyEnum {
    case a
    case ↓none
}
```

```swift
enum MyEnum {
    case ↓none
    case b
}
```

```swift
enum MyEnum {
    case a
    case ↓none
    case b
}
```

```swift
class MyClass {
    ↓static let none = MyClass()
}
```

```swift
class MyClass {
    ↓static let none: MyClass = MyClass()
}
```

```swift
class MyClass {
    ↓static var none: MyClass = MyClass()
}
```

```swift
class MyClass {
    ↓class var none: MyClass { MyClass() }
}
```

```swift
struct MyStruct {
    ↓static var none = MyStruct()
}
```

```swift
struct MyStruct {
    ↓static var none: MyStruct = MyStruct()
}
```

```swift
struct MyStruct {
    ↓static var none = MyStruct()
}
```

```swift
struct MyStruct {
    ↓static var none: MyStruct = MyStruct()
}
```

```swift
struct MyStruct {
    ↓static var a = MyStruct(), none = MyStruct()
}
```

```swift
struct MyStruct {
    ↓static var none = MyStruct(), a = MyStruct()
}
```