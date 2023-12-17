# Discouraged Optional Collection

Prefer empty collection over optional collection

* **Identifier:** discouraged_optional_collection
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
var foo: [Int]
```

```swift
var foo: [String: Int]
```

```swift
var foo: Set<String>
```

```swift
var foo: [String: [String: Int]]
```

```swift
let foo: [Int] = []
```

```swift
let foo: [String: Int] = [:]
```

```swift
let foo: Set<String> = []
```

```swift
let foo: [String: [String: Int]] = [:]
```

```swift
var foo: [Int] { return [] }
```

```swift
func foo() -> [Int] {}
```

```swift
func foo() -> [String: String] {}
```

```swift
func foo() -> Set<Int> {}
```

```swift
func foo() -> ([Int]) -> String {}
```

```swift
func foo(input: [String] = []) {}
```

```swift
func foo(input: [String: String] = [:]) {}
```

```swift
func foo(input: Set<String> = []) {}
```

```swift
class Foo {
    func foo() -> [Int] {}
}
```

```swift
class Foo {
    func foo() -> [String: String] {}
}
```

```swift
class Foo {
    func foo() -> Set<Int> {}
}
```

```swift
class Foo {
    func foo() -> ([Int]) -> String {}
}
```

```swift
struct Foo {
    func foo() -> [Int] {}
}
```

```swift
struct Foo {
    func foo() -> [String: String] {}
}
```

```swift
struct Foo {
    func foo() -> Set<Int> {}
}
```

```swift
struct Foo {
    func foo() -> ([Int]) -> String {}
}
```

```swift
enum Foo {
    func foo() -> [Int] {}
}
```

```swift
enum Foo {
    func foo() -> [String: String] {}
}
```

```swift
enum Foo {
    func foo() -> Set<Int> {}
}
```

```swift
enum Foo {
    func foo() -> ([Int]) -> String {}
}
```

```swift
class Foo {
    func foo(input: [String] = []) {}
}
```

```swift
class Foo {
    func foo(input: [String: String] = [:]) {}
}
```

```swift
class Foo {
    func foo(input: Set<String> = []) {}
}
```

```swift
struct Foo {
    func foo(input: [String] = []) {}
}
```

```swift
struct Foo {
    func foo(input: [String: String] = [:]) {}
}
```

```swift
struct Foo {
    func foo(input: Set<String> = []) {}
}
```

```swift
enum Foo {
    func foo(input: [String] = []) {}
}
```

```swift
enum Foo {
    func foo(input: [String: String] = [:]) {}
}
```

```swift
enum Foo {
    func foo(input: Set<String> = []) {}
}
```

## Triggering Examples

```swift
↓var foo: [Int]?
```

```swift
↓var foo: [String: Int]?
```

```swift
↓var foo: Set<String>?
```

```swift
↓let foo: [Int]? = nil
```

```swift
↓let foo: [String: Int]? = nil
```

```swift
↓let foo: Set<String>? = nil
```

```swift
↓var foo: [Int]? { return nil }
```

```swift
↓let foo: [Int]? { return nil }()
```

```swift
func ↓foo() -> [T]? {}
```

```swift
func ↓foo() -> [String: String]? {}
```

```swift
func ↓foo() -> [String: [String: String]]? {}
```

```swift
func ↓foo() -> [String: [String: String]?] {}
```

```swift
func ↓foo() -> Set<Int>? {}
```

```swift
static func ↓foo() -> [T]? {}
```

```swift
static func ↓foo() -> [String: String]? {}
```

```swift
static func ↓foo() -> [String: [String: String]]? {}
```

```swift
static func ↓foo() -> [String: [String: String]?] {}
```

```swift
static func ↓foo() -> Set<Int>? {}
```

```swift
func ↓foo() -> ([Int]?) -> String {}
```

```swift
func ↓foo() -> ([Int]) -> [String]? {}
```

```swift
func foo(↓input: [String: String]?) {}
```

```swift
func foo(↓input: [String: [String: String]]?) {}
```

```swift
func foo(↓input: [String: [String: String]?]) {}
```

```swift
func foo(↓↓input: [String: [String: String]?]?) {}
```

```swift
func foo<K, V>(_ dict1: [K: V], ↓_ dict2: [K: V]?) -> [K: V]
```

```swift
func foo<K, V>(dict1: [K: V], ↓dict2: [K: V]?) -> [K: V]
```

```swift
static func foo(↓input: [String: String]?) {}
```

```swift
static func foo(↓input: [String: [String: String]]?) {}
```

```swift
static func foo(↓input: [String: [String: String]?]) {}
```

```swift
static func foo(↓↓input: [String: [String: String]?]?) {}
```

```swift
static func foo<K, V>(_ dict1: [K: V], ↓_ dict2: [K: V]?) -> [K: V]
```

```swift
static func foo<K, V>(dict1: [K: V], ↓dict2: [K: V]?) -> [K: V]
```

```swift
class Foo {
    ↓var foo: [Int]?
}
```

```swift
class Foo {
    ↓var foo: [String: Int]?
}
```

```swift
class Foo {
    ↓var foo: Set<String>?
}
```

```swift
class Foo {
    ↓let foo: [Int]? = nil
}
```

```swift
class Foo {
    ↓let foo: [String: Int]? = nil
}
```

```swift
class Foo {
    ↓let foo: Set<String>? = nil
}
```

```swift
struct Foo {
    ↓var foo: [Int]?
}
```

```swift
struct Foo {
    ↓var foo: [String: Int]?
}
```

```swift
struct Foo {
    ↓var foo: Set<String>?
}
```

```swift
struct Foo {
    ↓let foo: [Int]? = nil
}
```

```swift
struct Foo {
    ↓let foo: [String: Int]? = nil
}
```

```swift
struct Foo {
    ↓let foo: Set<String>? = nil
}
```

```swift
class Foo {
    ↓var foo: [Int]? { return nil }
}
```

```swift
class Foo {
    ↓let foo: [Int]? { return nil }()
}
```

```swift
class Foo {
    ↓var foo: Set<String>? { return nil }
}
```

```swift
class Foo {
    ↓let foo: Set<String>? { return nil }()
}
```

```swift
struct Foo {
    ↓var foo: [Int]? { return nil }
}
```

```swift
struct Foo {
    ↓let foo: [Int]? { return nil }()
}
```

```swift
struct Foo {
    ↓var foo: Set<String>? { return nil }
}
```

```swift
struct Foo {
    ↓let foo: Set<String>? { return nil }()
}
```

```swift
enum Foo {
    ↓var foo: [Int]? { return nil }
}
```

```swift
enum Foo {
    ↓let foo: [Int]? { return nil }()
}
```

```swift
enum Foo {
    ↓var foo: Set<String>? { return nil }
}
```

```swift
enum Foo {
    ↓let foo: Set<String>? { return nil }()
}
```

```swift
class Foo {
    func ↓foo() -> [T]? {}
}
```

```swift
class Foo {
    func ↓foo() -> [String: String]? {}
}
```

```swift
class Foo {
    func ↓foo() -> [String: [String: String]]? {}
}
```

```swift
class Foo {
    func ↓foo() -> [String: [String: String]?] {}
}
```

```swift
class Foo {
    func ↓foo() -> Set<Int>? {}
}
```

```swift
class Foo {
    static func ↓foo() -> [T]? {}
}
```

```swift
class Foo {
    static func ↓foo() -> [String: String]? {}
}
```

```swift
class Foo {
    static func ↓foo() -> [String: [String: String]]? {}
}
```

```swift
class Foo {
    static func ↓foo() -> [String: [String: String]?] {}
}
```

```swift
class Foo {
    static func ↓foo() -> Set<Int>? {}
}
```

```swift
class Foo {
    func ↓foo() -> ([Int]?) -> String {}
}
```

```swift
class Foo {
    func ↓foo() -> ([Int]) -> [String]? {}
}
```

```swift
struct Foo {
    func ↓foo() -> [T]? {}
}
```

```swift
struct Foo {
    func ↓foo() -> [String: String]? {}
}
```

```swift
struct Foo {
    func ↓foo() -> [String: [String: String]]? {}
}
```

```swift
struct Foo {
    func ↓foo() -> [String: [String: String]?] {}
}
```

```swift
struct Foo {
    func ↓foo() -> Set<Int>? {}
}
```

```swift
struct Foo {
    static func ↓foo() -> [T]? {}
}
```

```swift
struct Foo {
    static func ↓foo() -> [String: String]? {}
}
```

```swift
struct Foo {
    static func ↓foo() -> [String: [String: String]]? {}
}
```

```swift
struct Foo {
    static func ↓foo() -> [String: [String: String]?] {}
}
```

```swift
struct Foo {
    static func ↓foo() -> Set<Int>? {}
}
```

```swift
struct Foo {
    func ↓foo() -> ([Int]?) -> String {}
}
```

```swift
struct Foo {
    func ↓foo() -> ([Int]) -> [String]? {}
}
```

```swift
enum Foo {
    func ↓foo() -> [T]? {}
}
```

```swift
enum Foo {
    func ↓foo() -> [String: String]? {}
}
```

```swift
enum Foo {
    func ↓foo() -> [String: [String: String]]? {}
}
```

```swift
enum Foo {
    func ↓foo() -> [String: [String: String]?] {}
}
```

```swift
enum Foo {
    func ↓foo() -> Set<Int>? {}
}
```

```swift
enum Foo {
    static func ↓foo() -> [T]? {}
}
```

```swift
enum Foo {
    static func ↓foo() -> [String: String]? {}
}
```

```swift
enum Foo {
    static func ↓foo() -> [String: [String: String]]? {}
}
```

```swift
enum Foo {
    static func ↓foo() -> [String: [String: String]?] {}
}
```

```swift
enum Foo {
    static func ↓foo() -> Set<Int>? {}
}
```

```swift
enum Foo {
    func ↓foo() -> ([Int]?) -> String {}
}
```

```swift
enum Foo {
    func ↓foo() -> ([Int]) -> [String]? {}
}
```

```swift
class Foo {
    func foo(↓input: [String: String]?) {}
}
```

```swift
class Foo {
    func foo(↓input: [String: [String: String]]?) {}
}
```

```swift
class Foo {
    func foo(↓input: [String: [String: String]?]) {}
}
```

```swift
class Foo {
    func foo(↓↓input: [String: [String: String]?]?) {}
}
```

```swift
class Foo {
    func foo<K, V>(_ dict1: [K: V], ↓_ dict2: [K: V]?) -> [K: V]
}
```

```swift
class Foo {
    func foo<K, V>(dict1: [K: V], ↓dict2: [K: V]?) -> [K: V]
}
```

```swift
class Foo {
    static func foo(↓input: [String: String]?) {}
}
```

```swift
class Foo {
    static func foo(↓input: [String: [String: String]]?) {}
}
```

```swift
class Foo {
    static func foo(↓input: [String: [String: String]?]) {}
}
```

```swift
class Foo {
    static func foo(↓↓input: [String: [String: String]?]?) {}
}
```

```swift
class Foo {
    static func foo<K, V>(_ dict1: [K: V], ↓_ dict2: [K: V]?) -> [K: V]
}
```

```swift
class Foo {
    static func foo<K, V>(dict1: [K: V], ↓dict2: [K: V]?) -> [K: V]
}
```

```swift
struct Foo {
    func foo(↓input: [String: String]?) {}
}
```

```swift
struct Foo {
    func foo(↓input: [String: [String: String]]?) {}
}
```

```swift
struct Foo {
    func foo(↓input: [String: [String: String]?]) {}
}
```

```swift
struct Foo {
    func foo(↓↓input: [String: [String: String]?]?) {}
}
```

```swift
struct Foo {
    func foo<K, V>(_ dict1: [K: V], ↓_ dict2: [K: V]?) -> [K: V]
}
```

```swift
struct Foo {
    func foo<K, V>(dict1: [K: V], ↓dict2: [K: V]?) -> [K: V]
}
```

```swift
struct Foo {
    static func foo(↓input: [String: String]?) {}
}
```

```swift
struct Foo {
    static func foo(↓input: [String: [String: String]]?) {}
}
```

```swift
struct Foo {
    static func foo(↓input: [String: [String: String]?]) {}
}
```

```swift
struct Foo {
    static func foo(↓↓input: [String: [String: String]?]?) {}
}
```

```swift
struct Foo {
    static func foo<K, V>(_ dict1: [K: V], ↓_ dict2: [K: V]?) -> [K: V]
}
```

```swift
struct Foo {
    static func foo<K, V>(dict1: [K: V], ↓dict2: [K: V]?) -> [K: V]
}
```

```swift
enum Foo {
    func foo(↓input: [String: String]?) {}
}
```

```swift
enum Foo {
    func foo(↓input: [String: [String: String]]?) {}
}
```

```swift
enum Foo {
    func foo(↓input: [String: [String: String]?]) {}
}
```

```swift
enum Foo {
    func foo(↓↓input: [String: [String: String]?]?) {}
}
```

```swift
enum Foo {
    func foo<K, V>(_ dict1: [K: V], ↓_ dict2: [K: V]?) -> [K: V]
}
```

```swift
enum Foo {
    func foo<K, V>(dict1: [K: V], ↓dict2: [K: V]?) -> [K: V]
}
```

```swift
enum Foo {
    static func foo(↓input: [String: String]?) {}
}
```

```swift
enum Foo {
    static func foo(↓input: [String: [String: String]]?) {}
}
```

```swift
enum Foo {
    static func foo(↓input: [String: [String: String]?]) {}
}
```

```swift
enum Foo {
    static func foo(↓↓input: [String: [String: String]?]?) {}
}
```

```swift
enum Foo {
    static func foo<K, V>(_ dict1: [K: V], ↓_ dict2: [K: V]?) -> [K: V]
}
```

```swift
enum Foo {
    static func foo<K, V>(dict1: [K: V], ↓dict2: [K: V]?) -> [K: V]
}
```