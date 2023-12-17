# Syntactic Sugar

Shorthand syntactic sugar should be used, i.e. [Int] instead of Array<Int>.

* **Identifier:** syntactic_sugar
* **Enabled by default:** Yes
* **Supports autocorrection:** Yes
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
let x: [Int]
```

```swift
let x: [Int: String]
```

```swift
let x: Int?
```

```swift
func x(a: [Int], b: Int) -> [Int: Any]
```

```swift
let x: Int!
```

```swift
extension Array {
  func x() { }
}
```

```swift
extension Dictionary {
  func x() { }
}
```

```swift
let x: CustomArray<String>
```

```swift
var currentIndex: Array<OnboardingPage>.Index?
```

```swift
func x(a: [Int], b: Int) -> Array<Int>.Index
```

```swift
unsafeBitCast(nonOptionalT, to: Optional<T>.self)
```

```swift
unsafeBitCast(someType, to: Swift.Array<T>.self)
```

```swift
IndexingIterator<Array<Dictionary<String, AnyObject>>>.self
```

```swift
let y = Optional<String>.Type
```

```swift
type is Optional<String>.Type
```

```swift
let x: Foo.Optional<String>
```

```swift
let x = case Optional<Any>.none = obj
```

```swift
let a = Swift.Optional<String?>.none
```

## Triggering Examples

```swift
let x: ↓Array<String>
```

```swift
let x: ↓Dictionary<Int, String>
```

```swift
let x: ↓Optional<Int>
```

```swift
let x: ↓Swift.Array<String>
```

```swift
func x(a: ↓Array<Int>, b: Int) -> [Int: Any]
```

```swift
func x(a: ↓Swift.Array<Int>, b: Int) -> [Int: Any]
```

```swift
func x(a: [Int], b: Int) -> ↓Dictionary<Int, String>
```

```swift
let x = y as? ↓Array<[String: Any]>
```

```swift
let x = Box<Array<T>>()
```

```swift
func x() -> Box<↓Array<T>>
```

```swift
func x() -> ↓Dictionary<String, Any>?
```

```swift
typealias Document = ↓Dictionary<String, T?>
```

```swift
func x(_ y: inout ↓Array<T>)
```

```swift
let x:↓Dictionary<String, ↓Dictionary<Int, Int>>
```

```swift
func x() -> Any { return ↓Dictionary<Int, String>()}
```

```swift
let x = ↓Array<String>.array(of: object)
```

```swift
let x = ↓Swift.Array<String>.array(of: object)
```

```swift
@_specialize(where S == ↓Array<Character>)
public init<S: Sequence>(_ elements: S)
```

```swift
let dict: [String: Any] = [:]
_ = dict["key"] as? ↓Optional<String?> ?? Optional<String?>.none
```