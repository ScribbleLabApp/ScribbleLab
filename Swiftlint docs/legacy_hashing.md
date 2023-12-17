# Legacy Hashing

Prefer using the `hash(into:)` function instead of overriding `hashValue`

* **Identifier:** legacy_hashing
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
struct Foo: Hashable {
  let bar: Int = 10

  func hash(into hasher: inout Hasher) {
    hasher.combine(bar)
  }
}
```

```swift
class Foo: Hashable {
  let bar: Int = 10

  func hash(into hasher: inout Hasher) {
    hasher.combine(bar)
  }
}
```

```swift
var hashValue: Int { return 1 }
class Foo: Hashable { 
 }
```

```swift
class Foo: Hashable {
  let bar: String = "Foo"

  public var hashValue: String {
    return bar
  }
}
```

```swift
class Foo: Hashable {
  let bar: String = "Foo"

  public var hashValue: String {
    get { return bar }
    set { bar = newValue }
  }
}
```

## Triggering Examples

```swift
struct Foo: Hashable {
    let bar: Int = 10

    public ↓var hashValue: Int {
        return bar
    }
}
```

```swift
class Foo: Hashable {
    let bar: Int = 10

    public ↓var hashValue: Int {
        return bar
    }
}
```