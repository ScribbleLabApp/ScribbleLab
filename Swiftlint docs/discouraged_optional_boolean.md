# Discouraged Optional Boolean

Prefer non-optional booleans over optional booleans

* **Identifier:** discouraged_optional_boolean
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
var foo: Bool
```

```swift
var foo: [String: Bool]
```

```swift
var foo: [Bool]
```

```swift
let foo: Bool = true
```

```swift
let foo: Bool = false
```

```swift
let foo: [String: Bool] = [:]
```

```swift
let foo: [Bool] = []
```

```swift
var foo: Bool { return true }
```

```swift
let foo: Bool { return false }()
```

```swift
func foo() -> Bool {}
```

```swift
func foo() -> [String: Bool] {}
```

```swift
func foo() -> ([Bool]) -> String {}
```

```swift
func foo(input: Bool = true) {}
```

```swift
func foo(input: [String: Bool] = [:]) {}
```

```swift
func foo(input: [Bool] = []) {}
```

```swift
class Foo {
	func foo() -> Bool {}
}
```

```swift
class Foo {
	func foo() -> [String: Bool] {}
}
```

```swift
class Foo {
	func foo() -> ([Bool]) -> String {}
}
```

```swift
struct Foo {
	func foo() -> Bool {}
}
```

```swift
struct Foo {
	func foo() -> [String: Bool] {}
}
```

```swift
struct Foo {
	func foo() -> ([Bool]) -> String {}
}
```

```swift
enum Foo {
	func foo() -> Bool {}
}
```

```swift
enum Foo {
	func foo() -> [String: Bool] {}
}
```

```swift
enum Foo {
	func foo() -> ([Bool]) -> String {}
}
```

```swift
class Foo {
	func foo(input: Bool = true) {}
}
```

```swift
class Foo {
	func foo(input: [String: Bool] = [:]) {}
}
```

```swift
class Foo {
	func foo(input: [Bool] = []) {}
}
```

```swift
struct Foo {
	func foo(input: Bool = true) {}
}
```

```swift
struct Foo {
	func foo(input: [String: Bool] = [:]) {}
}
```

```swift
struct Foo {
	func foo(input: [Bool] = []) {}
}
```

```swift
enum Foo {
	func foo(input: Bool = true) {}
}
```

```swift
enum Foo {
	func foo(input: [String: Bool] = [:]) {}
}
```

```swift
enum Foo {
	func foo(input: [Bool] = []) {}
}
```

## Triggering Examples

```swift
var foo: ↓Bool?
```

```swift
var foo: [String: ↓Bool?]
```

```swift
var foo: [↓Bool?]
```

```swift
let foo: ↓Bool? = nil
```

```swift
let foo: [String: ↓Bool?] = [:]
```

```swift
let foo: [↓Bool?] = []
```

```swift
let foo = ↓Optional.some(false)
```

```swift
let foo = ↓Optional.some(true)
```

```swift
var foo: ↓Bool? { return nil }
```

```swift
let foo: ↓Bool? { return nil }()
```

```swift
func foo() -> ↓Bool? {}
```

```swift
func foo() -> [String: ↓Bool?] {}
```

```swift
func foo() -> [↓Bool?] {}
```

```swift
static func foo() -> ↓Bool? {}
```

```swift
static func foo() -> [String: ↓Bool?] {}
```

```swift
static func foo() -> [↓Bool?] {}
```

```swift
func foo() -> (↓Bool?) -> String {}
```

```swift
func foo() -> ([Int]) -> ↓Bool? {}
```

```swift
func foo(input: ↓Bool?) {}
```

```swift
func foo(input: [String: ↓Bool?]) {}
```

```swift
func foo(input: [↓Bool?]) {}
```

```swift
static func foo(input: ↓Bool?) {}
```

```swift
static func foo(input: [String: ↓Bool?]) {}
```

```swift
static func foo(input: [↓Bool?]) {}
```

```swift
class Foo {
	var foo: ↓Bool?
}
```

```swift
class Foo {
	var foo: [String: ↓Bool?]
}
```

```swift
class Foo {
	let foo: ↓Bool? = nil
}
```

```swift
class Foo {
	let foo: [String: ↓Bool?] = [:]
}
```

```swift
class Foo {
	let foo: [↓Bool?] = []
}
```

```swift
struct Foo {
	var foo: ↓Bool?
}
```

```swift
struct Foo {
	var foo: [String: ↓Bool?]
}
```

```swift
struct Foo {
	let foo: ↓Bool? = nil
}
```

```swift
struct Foo {
	let foo: [String: ↓Bool?] = [:]
}
```

```swift
struct Foo {
	let foo: [↓Bool?] = []
}
```

```swift
class Foo {
	var foo: ↓Bool? { return nil }
}
```

```swift
class Foo {
	let foo: ↓Bool? { return nil }()
}
```

```swift
struct Foo {
	var foo: ↓Bool? { return nil }
}
```

```swift
struct Foo {
	let foo: ↓Bool? { return nil }()
}
```

```swift
enum Foo {
	var foo: ↓Bool? { return nil }
}
```

```swift
enum Foo {
	let foo: ↓Bool? { return nil }()
}
```

```swift
class Foo {
	func foo() -> ↓Bool? {}
}
```

```swift
class Foo {
	func foo() -> [String: ↓Bool?] {}
}
```

```swift
class Foo {
	func foo() -> [↓Bool?] {}
}
```

```swift
class Foo {
	static func foo() -> ↓Bool? {}
}
```

```swift
class Foo {
	static func foo() -> [String: ↓Bool?] {}
}
```

```swift
class Foo {
	static func foo() -> [↓Bool?] {}
}
```

```swift
class Foo {
	func foo() -> (↓Bool?) -> String {}
}
```

```swift
class Foo {
	func foo() -> ([Int]) -> ↓Bool? {}
}
```

```swift
struct Foo {
	func foo() -> ↓Bool? {}
}
```

```swift
struct Foo {
	func foo() -> [String: ↓Bool?] {}
}
```

```swift
struct Foo {
	func foo() -> [↓Bool?] {}
}
```

```swift
struct Foo {
	static func foo() -> ↓Bool? {}
}
```

```swift
struct Foo {
	static func foo() -> [String: ↓Bool?] {}
}
```

```swift
struct Foo {
	static func foo() -> [↓Bool?] {}
}
```

```swift
struct Foo {
	func foo() -> (↓Bool?) -> String {}
}
```

```swift
struct Foo {
	func foo() -> ([Int]) -> ↓Bool? {}
}
```

```swift
enum Foo {
	func foo() -> ↓Bool? {}
}
```

```swift
enum Foo {
	func foo() -> [String: ↓Bool?] {}
}
```

```swift
enum Foo {
	func foo() -> [↓Bool?] {}
}
```

```swift
enum Foo {
	static func foo() -> ↓Bool? {}
}
```

```swift
enum Foo {
	static func foo() -> [String: ↓Bool?] {}
}
```

```swift
enum Foo {
	static func foo() -> [↓Bool?] {}
}
```

```swift
enum Foo {
	func foo() -> (↓Bool?) -> String {}
}
```

```swift
enum Foo {
	func foo() -> ([Int]) -> ↓Bool? {}
}
```

```swift
class Foo {
	func foo(input: ↓Bool?) {}
}
```

```swift
class Foo {
	func foo(input: [String: ↓Bool?]) {}
}
```

```swift
class Foo {
	func foo(input: [↓Bool?]) {}
}
```

```swift
class Foo {
	static func foo(input: ↓Bool?) {}
}
```

```swift
class Foo {
	static func foo(input: [String: ↓Bool?]) {}
}
```

```swift
class Foo {
	static func foo(input: [↓Bool?]) {}
}
```

```swift
struct Foo {
	func foo(input: ↓Bool?) {}
}
```

```swift
struct Foo {
	func foo(input: [String: ↓Bool?]) {}
}
```

```swift
struct Foo {
	func foo(input: [↓Bool?]) {}
}
```

```swift
struct Foo {
	static func foo(input: ↓Bool?) {}
}
```

```swift
struct Foo {
	static func foo(input: [String: ↓Bool?]) {}
}
```

```swift
struct Foo {
	static func foo(input: [↓Bool?]) {}
}
```

```swift
enum Foo {
	func foo(input: ↓Bool?) {}
}
```

```swift
enum Foo {
	func foo(input: [String: ↓Bool?]) {}
}
```

```swift
enum Foo {
	func foo(input: [↓Bool?]) {}
}
```

```swift
enum Foo {
	static func foo(input: ↓Bool?) {}
}
```

```swift
enum Foo {
	static func foo(input: [String: ↓Bool?]) {}
}
```

```swift
enum Foo {
	static func foo(input: [↓Bool?]) {}
}
```

```swift
_ = ↓Bool?.values()
```