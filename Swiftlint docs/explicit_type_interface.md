# Explicit Type Interface

Properties should have a type interface

* **Identifier:** explicit_type_interface
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
  <tr>
  <td>
  excluded
  </td>
  <td>
  []
  </td>
  </tr>
  <tr>
  <td>
  allow_redundancy
  </td>
  <td>
  false
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
class Foo {
  var myVar: Int? = 0
}
```

```swift
class Foo {
  let myVar: Int? = 0, s: String = ""
}
```

```swift
class Foo {
  static var myVar: Int? = 0
}
```

```swift
class Foo {
  class var myVar: Int? = 0
}
```

## Triggering Examples

```swift
class Foo {
  var ↓myVar = 0
}
```

```swift
class Foo {
  let ↓mylet = 0
}
```

```swift
class Foo {
  static var ↓myStaticVar = 0
}
```

```swift
class Foo {
  class var ↓myClassVar = 0
}
```

```swift
class Foo {
  let ↓myVar = Int(0), ↓s = ""
}
```

```swift
class Foo {
  let ↓myVar = Set<Int>(0)
}
```