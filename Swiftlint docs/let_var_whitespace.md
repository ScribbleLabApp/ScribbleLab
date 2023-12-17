# Variable Declaration Whitespace

Variable declarations should be separated from other statements by a blank line

* **Identifier:** let_var_whitespace
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
  </tbody>
  </table>

## Non Triggering Examples

```swift
let a = 0
var x = 1

x = 2
```

```swift
a = 5

var x = 1
```

```swift
struct X {
	var a = 0
}
```

```swift
let a = 1 +
	2
let b = 5
```

```swift
var x: Int {
	return 0
}
```

```swift
var x: Int {
	let a = 0

	return a
}
```

```swift
#if os(macOS)
let a = 0
#endif
```

```swift
#warning("TODO: remove it")
let a = 0
```

```swift
#error("TODO: remove it")
let a = 0
```

```swift
@available(swift 4)
let a = 0
```

```swift
class C {
	@objc
	var s: String = ""
}
```

```swift
class C {
	@objc
	func a() {}
}
```

```swift
class C {
	var x = 0
	lazy
	var y = 0
}
```

```swift
@available(OSX, introduced: 10.6)
@available(*, deprecated)
var x = 0
```

```swift
// swiftlint:disable superfluous_disable_command
// swiftlint:disable force_cast

let x = bar as! Bar
```

```swift
    @available(swift 4)
    @UserDefault("param", defaultValue: true)
    var isEnabled = true

    @Attribute
    func f() {}
```

```swift
var x: Int {
	let a = 0
	return a
}
```

## Triggering Examples

```swift
var x = 1
↓x = 2
```

```swift

a = 5
↓var x = 1
```

```swift
struct X {
	let a
	↓func x() {}
}
```

```swift
var x = 0
↓@objc func f() {}
```

```swift
var x = 0
↓@objc
	func f() {}
```

```swift
@objc func f() {
}
↓var x = 0
```

```swift
    struct S {
        func f() {}
        ↓@Wapper
        let isNumber = false
        @Wapper
        var isEnabled = true
        ↓func g() {}
    }
```