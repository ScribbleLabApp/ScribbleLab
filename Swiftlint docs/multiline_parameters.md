# Multiline Parameters

Functions and methods parameters should be either on the same line, or one per line

* **Identifier:** multiline_parameters
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
  allows_single_line
  </td>
  <td>
  true
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
func foo() { }
```

```swift
func foo(param1: Int) { }
```

```swift
func foo(param1: Int, param2: Bool) { }
```

```swift
func foo(param1: Int, param2: Bool, param3: [String]) { }
```

```swift
func foo(param1: Int,
         param2: Bool,
         param3: [String]) { }
```

```swift
func foo(_ param1: Int, param2: Int, param3: Int) -> (Int) -> Int {
   return { x in x + param1 + param2 + param3 }
}
```

```swift
static func foo() { }
```

```swift
static func foo(param1: Int) { }
```

```swift
static func foo(param1: Int, param2: Bool) { }
```

```swift
static func foo(param1: Int, param2: Bool, param3: [String]) { }
```

```swift
static func foo(param1: Int,
                param2: Bool,
                param3: [String]) { }
```

```swift
protocol Foo {
	func foo() { }
}
```

```swift
protocol Foo {
	func foo(param1: Int) { }
}
```

```swift
protocol Foo {
	func foo(param1: Int, param2: Bool) { }
}
```

```swift
protocol Foo {
	func foo(param1: Int, param2: Bool, param3: [String]) { }
}
```

```swift
protocol Foo {
   func foo(param1: Int,
            param2: Bool,
            param3: [String]) { }
}
```

```swift
protocol Foo {
	static func foo(param1: Int, param2: Bool, param3: [String]) { }
}
```

```swift
protocol Foo {
   static func foo(param1: Int,
                   param2: Bool,
                   param3: [String]) { }
}
```

```swift
protocol Foo {
	class func foo(param1: Int, param2: Bool, param3: [String]) { }
}
```

```swift
protocol Foo {
   class func foo(param1: Int,
                  param2: Bool,
                  param3: [String]) { }
}
```

```swift
enum Foo {
	func foo() { }
}
```

```swift
enum Foo {
	func foo(param1: Int) { }
}
```

```swift
enum Foo {
	func foo(param1: Int, param2: Bool) { }
}
```

```swift
enum Foo {
	func foo(param1: Int, param2: Bool, param3: [String]) { }
}
```

```swift
enum Foo {
   func foo(param1: Int,
            param2: Bool,
            param3: [String]) { }
}
```

```swift
enum Foo {
	static func foo(param1: Int, param2: Bool, param3: [String]) { }
}
```

```swift
enum Foo {
   static func foo(param1: Int,
                   param2: Bool,
                   param3: [String]) { }
}
```

```swift
struct Foo {
	func foo() { }
}
```

```swift
struct Foo {
	func foo(param1: Int) { }
}
```

```swift
struct Foo {
	func foo(param1: Int, param2: Bool) { }
}
```

```swift
struct Foo {
	func foo(param1: Int, param2: Bool, param3: [String]) { }
}
```

```swift
struct Foo {
   func foo(param1: Int,
            param2: Bool,
            param3: [String]) { }
}
```

```swift
struct Foo {
	static func foo(param1: Int, param2: Bool, param3: [String]) { }
}
```

```swift
struct Foo {
   static func foo(param1: Int,
                   param2: Bool,
                   param3: [String]) { }
}
```

```swift
class Foo {
	func foo() { }
}
```

```swift
class Foo {
	func foo(param1: Int) { }
}
```

```swift
class Foo {
	func foo(param1: Int, param2: Bool) { }
}
```

```swift
class Foo {
	func foo(param1: Int, param2: Bool, param3: [String]) { }
	}
```

```swift
class Foo {
   func foo(param1: Int,
            param2: Bool,
            param3: [String]) { }
}
```

```swift
class Foo {
	class func foo(param1: Int, param2: Bool, param3: [String]) { }
}
```

```swift
class Foo {
   class func foo(param1: Int,
                  param2: Bool,
                  param3: [String]) { }
}
```

```swift
class Foo {
   class func foo(param1: Int,
                  param2: Bool,
                  param3: @escaping (Int, Int) -> Void = { _, _ in }) { }
}
```

```swift
class Foo {
   class func foo(param1: Int,
                  param2: Bool,
                  param3: @escaping (Int) -> Void = { _ in }) { }
}
```

```swift
class Foo {
   class func foo(param1: Int,
                  param2: Bool,
                  param3: @escaping ((Int) -> Void)? = nil) { }
}
```

```swift
class Foo {
   class func foo(param1: Int,
                  param2: Bool,
                  param3: @escaping ((Int) -> Void)? = { _ in }) { }
}
```

```swift
class Foo {
   class func foo(param1: Int,
                  param2: @escaping ((Int) -> Void)? = { _ in },
                  param3: Bool) { }
}
```

```swift
class Foo {
   class func foo(param1: Int,
                  param2: @escaping ((Int) -> Void)? = { _ in },
                  param3: @escaping (Int, Int) -> Void = { _, _ in }) { }
}
```

```swift
class Foo {
   class func foo(param1: Int,
                  param2: Bool,
                  param3: @escaping (Int) -> Void = { (x: Int) in }) { }
}
```

```swift
class Foo {
   class func foo(param1: Int,
                  param2: Bool,
                  param3: @escaping (Int, (Int) -> Void) -> Void = { (x: Int, f: (Int) -> Void) in }) { }
}
```

```swift
class Foo {
   init(param1: Int,
        param2: Bool,
        param3: @escaping ((Int) -> Void)? = { _ in }) { }
}
```

```swift
func foo() { }
```

```swift
func foo(param1: Int) { }
```

```swift
protocol Foo {
    func foo(param1: Int,
             param2: Bool,
             param3: [String]) { }
}
```

```swift
protocol Foo {
    func foo(
        param1: Int
    ) { }
}
```

```swift
protocol Foo {
    func foo(
        param1: Int,
        param2: Bool,
        param3: [String]
    ) { }
}
```

## Triggering Examples

```swift
func ↓foo(_ param1: Int,
          param2: Int, param3: Int) -> (Int) -> Int {
   return { x in x + param1 + param2 + param3 }
}
```

```swift
protocol Foo {
   func ↓foo(param1: Int,
             param2: Bool, param3: [String]) { }
}
```

```swift
protocol Foo {
   func ↓foo(param1: Int, param2: Bool,
             param3: [String]) { }
}
```

```swift
protocol Foo {
   static func ↓foo(param1: Int,
                    param2: Bool, param3: [String]) { }
}
```

```swift
protocol Foo {
   static func ↓foo(param1: Int, param2: Bool,
                    param3: [String]) { }
}
```

```swift
protocol Foo {
   class func ↓foo(param1: Int,
                   param2: Bool, param3: [String]) { }
}
```

```swift
protocol Foo {
   class func ↓foo(param1: Int, param2: Bool,
                   param3: [String]) { }
}
```

```swift
enum Foo {
   func ↓foo(param1: Int,
             param2: Bool, param3: [String]) { }
}
```

```swift
enum Foo {
   func ↓foo(param1: Int, param2: Bool,
             param3: [String]) { }
}
```

```swift
enum Foo {
   static func ↓foo(param1: Int,
                    param2: Bool, param3: [String]) { }
}
```

```swift
enum Foo {
   static func ↓foo(param1: Int, param2: Bool,
                    param3: [String]) { }
}
```

```swift
struct Foo {
   func ↓foo(param1: Int,
             param2: Bool, param3: [String]) { }
}
```

```swift
struct Foo {
   func ↓foo(param1: Int, param2: Bool,
             param3: [String]) { }
}
```

```swift
struct Foo {
   static func ↓foo(param1: Int,
                    param2: Bool, param3: [String]) { }
}
```

```swift
struct Foo {
   static func ↓foo(param1: Int, param2: Bool,
                    param3: [String]) { }
}
```

```swift
class Foo {
   func ↓foo(param1: Int,
             param2: Bool, param3: [String]) { }
}
```

```swift
class Foo {
   func ↓foo(param1: Int, param2: Bool,
             param3: [String]) { }
}
```

```swift
class Foo {
   class func ↓foo(param1: Int,
                   param2: Bool, param3: [String]) { }
}
```

```swift
class Foo {
   class func ↓foo(param1: Int, param2: Bool,
                   param3: [String]) { }
}
```

```swift
class Foo {
   class func ↓foo(param1: Int,
                  param2: Bool, param3: @escaping (Int, Int) -> Void = { _, _ in }) { }
}
```

```swift
class Foo {
   class func ↓foo(param1: Int,
                  param2: Bool, param3: @escaping (Int) -> Void = { (x: Int) in }) { }
}
```

```swift
class Foo {
  ↓init(param1: Int, param2: Bool,
        param3: @escaping ((Int) -> Void)? = { _ in }) { }
}
```

```swift
func ↓foo(param1: Int, param2: Bool) { }
```

```swift
func ↓foo(param1: Int, param2: Bool, param3: [String]) { }
```