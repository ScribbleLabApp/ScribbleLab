# Prefixed Top-Level Constant

Top-level constants should be prefixed by `k`

* **Identifier:** prefixed_toplevel_constant
* **Enabled by default:** No
* **Supports autocorrection:** No
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
  only_private
  </td>
  <td>
  false
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
private let kFoo = 20.0
```

```swift
public let kFoo = false
```

```swift
internal let kFoo = "Foo"
```

```swift
let kFoo = true
```

```swift
let Foo = true
```

```swift
struct Foo {
    let bar = 20.0
}
```

```swift
private var foo = 20.0
```

```swift
public var foo = false
```

```swift
internal var foo = "Foo"
```

```swift
var foo = true
```

```swift
var foo = true, bar = true
```

```swift
var foo = true, let kFoo = true
```

```swift
let
    kFoo = true
```

```swift
var foo: Int {
    return a + b
}
```

```swift
let kFoo = {
    return a + b
}()
```

```swift
var foo: String {
    let bar = ""
    return bar
}
```

```swift
if condition() {
    let result = somethingElse()
    print(result)
    exit()
}
```

```swift
[1, 2, 3, 1000, 4000].forEach { number in
    let isSmall = number < 10
    if isSmall {
        print("\(number) is a small number")
    }
}
```

## Triggering Examples

```swift
private let ↓Foo = 20.0
```

```swift
public let ↓Foo = false
```

```swift
internal let ↓Foo = "Foo"
```

```swift
let ↓Foo = true
```

```swift
let ↓foo = 2, ↓bar = true
```

```swift
let
    ↓foo = true
```

```swift
let ↓foo = {
    return a + b
}()
```