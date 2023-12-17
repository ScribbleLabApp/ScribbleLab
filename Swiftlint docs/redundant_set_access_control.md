# Redundant Access Control for Setter

Property setter access level shouldn't be explicit if it's the same as the variable access level

* **Identifier:** redundant_set_access_control
* **Enabled by default:** Yes
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
private(set) public var foo: Int
```

```swift
public let foo: Int
```

```swift
public var foo: Int
```

```swift
var foo: Int
```

```swift
private final class A {
  private(set) var value: Int
}
```

```swift
extension Color {
    public internal(set) static var someColor = Color.anotherColor
}
```

## Triggering Examples

```swift
↓private(set) private var foo: Int
```

```swift
↓fileprivate(set) fileprivate var foo: Int
```

```swift
↓internal(set) internal var foo: Int
```

```swift
↓public(set) public var foo: Int
```

```swift
open class Foo {
  ↓open(set) open var bar: Int
}
```

```swift
class A {
  ↓internal(set) var value: Int
}
```

```swift
internal class A {
  ↓internal(set) var value: Int
}
```

```swift
fileprivate class A {
  ↓fileprivate(set) var value: Int
}
```