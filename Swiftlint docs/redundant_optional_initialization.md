# Redundant Optional Initialization

Initializing an optional variable with nil is redundant

* **Identifier:** redundant_optional_initialization
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
var myVar: Int?
```

```swift
let myVar: Int? = nil
```

```swift
var myVar: Int? = 0
```

```swift
func foo(bar: Int? = 0) { }
```

```swift
var myVar: Optional<Int>
```

```swift
let myVar: Optional<Int> = nil
```

```swift
var myVar: Optional<Int> = 0
```

```swift
var foo: Int? {
  if bar != nil { }
  return 0
}
```

```swift
var foo: Int? = {
  if bar != nil { }
  return 0
}()
```

```swift
lazy var test: Int? = nil
```

```swift
func funcName() {
  var myVar: String?
}
```

```swift
func funcName() {
  let myVar: String? = nil
}
```

## Triggering Examples

```swift
var myVar: Int?↓ = nil
```

```swift
var myVar: Optional<Int>↓ = nil
```

```swift
var myVar: Int?↓=nil
```

```swift
var myVar: Optional<Int>↓=nil
)
```

```swift
var myVar: String?↓ = nil {
  didSet { print("didSet") }
}
```

```swift
func funcName() {
    var myVar: String?↓ = nil
}
```