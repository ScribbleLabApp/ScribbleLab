# Colon Spacing

Colons should be next to the identifier when specifying a type and next to the key in dictionary literals

* **Identifier:** colon
* **Enabled by default:** Yes
* **Supports autocorrection:** Yes
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
  flexible_right_spacing
  </td>
  <td>
  false
  </td>
  </tr>
  <tr>
  <td>
  apply_to_dictionaries
  </td>
  <td>
  true
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
let abc: Void
```

```swift
let abc: [Void: Void]
```

```swift
let abc: (Void, Void)
```

```swift
let abc: ([Void], String, Int)
```

```swift
let abc: [([Void], String, Int)]
```

```swift
let abc: String="def"
```

```swift
let abc: Int=0
```

```swift
let abc: Enum=Enum.Value
```

```swift
func abc(def: Void) {}
```

```swift
func abc(def: Void, ghi: Void) {}
```

```swift
let abc: String = "abc:"
```

```swift
let abc = [Void: Void]()
```

```swift
let abc = [1: [3: 2], 3: 4]
```

```swift
let abc = ["string": "string"]
```

```swift
let abc = ["string:string": "string"]
```

```swift
let abc: [String: Int]
```

```swift
func foo(bar: [String: Int]) {}
```

```swift
func foo() -> [String: Int] { return [:] }
```

```swift
let abc: Any
```

```swift
let abc: [Any: Int]
```

```swift
let abc: [String: Any]
```

```swift
class Foo: Bar {}
```

```swift
class Foo<T>: Bar {}
```

```swift
class Foo<T: Equatable>: Bar {}
```

```swift
class Foo<T, U>: Bar {}
```

```swift
class Foo<T: Equatable> {}
```

```swift
object.method(x: /* comment */ 5)
```

```swift
switch foo {
case .bar:
    _ = something()
}
```

```swift
object.method(x: 5, y: "string")
```

```swift
object.method(x: 5, y:
              "string")
```

```swift
object.method(5, y: "string")
```

```swift
func abc() { def(ghi: jkl) }
```

```swift
func abc(def: Void) { ghi(jkl: mno) }
```

```swift
class ABC { let def = ghi(jkl: mno) } }
```

```swift
func foo() { let dict = [1: 1] }
```

```swift
let aaa = Self.bbb ? Self.ccc : Self.ddd else {
return nil
Example("}
```

```swift
range.flatMap(file.syntaxMap.kinds(inByteRange:)) ?? []
```

```swift
@objc(receiveReply:)
public class func receiveReply(_ reply: bad_instruction_exception_reply_t) -> CInt { 0 }
```

```swift
switch str {
case "adlm", "adlam":             return .adlam
case "aghb", "caucasianalbanian": return .caucasianAlbanian
default:                          return nil
}
```

```swift
precedencegroup PipelinePrecedence {
  associativity: left
}
infix operator |> : PipelinePrecedence
```

```swift
switch scalar {
  case 0x000A...0x000D /* LF ... CR */: return true
  case 0x0085 /* NEXT LINE (NEL) */: return true
  case 0x2028 /* LINE SEPARATOR */: return true
  case 0x2029 /* PARAGRAPH SEPARATOR */: return true
  default: return false
}
```

## Triggering Examples

```swift
let abc↓:Void
```

```swift
let abc↓:  Void
```

```swift
let abc↓ :Void
```

```swift
let abc↓ : Void
```

```swift
let abc↓ : [Void: Void]
```

```swift
let abc↓ : (Void, String, Int)
```

```swift
let abc↓ : ([Void], String, Int)
```

```swift
let abc↓ : [([Void], String, Int)]
```

```swift
let abc↓:  (Void, String, Int)
```

```swift
let abc↓:  ([Void], String, Int)
```

```swift
let abc↓:  [([Void], String, Int)]
```

```swift
let abc↓ :String="def"
```

```swift
let abc↓ :Int=0
```

```swift
let abc↓ :Int = 0
```

```swift
let abc↓:Int=0
```

```swift
let abc↓:Int = 0
```

```swift
let abc↓:Enum=Enum.Value
```

```swift
func abc(def↓:Void) {}
```

```swift
func abc(def↓:  Void) {}
```

```swift
func abc(def↓ :Void) {}
```

```swift
func abc(def↓ : Void) {}
```

```swift
func abc(def: Void, ghi↓ :Void) {}
```

```swift
let abc = [Void↓:Void]()
```

```swift
let abc = [Void↓ : Void]()
```

```swift
let abc = [Void↓:  Void]()
```

```swift
let abc = [Void↓ :  Void]()
```

```swift
let abc = [1: [3↓ : 2], 3: 4]
```

```swift
let abc = [1: [3↓ : 2], 3↓:  4]
```

```swift
let abc: [String↓ : Int]
```

```swift
let abc: [String↓:Int]
```

```swift
func foo(bar: [String↓ : Int]) {}
```

```swift
func foo(bar: [String↓:Int]) {}
```

```swift
func foo() -> [String↓ : Int] { return [:] }
```

```swift
func foo() -> [String↓:Int] { return [:] }
```

```swift
let abc↓ : Any
```

```swift
let abc: [Any↓ : Int]
```

```swift
let abc: [String↓ : Any]
```

```swift
class Foo↓ : Bar {}
```

```swift
class Foo↓:Bar {}
```

```swift
class Foo<T>↓ : Bar {}
```

```swift
class Foo<T>↓:Bar {}
```

```swift
class Foo<T, U>↓:Bar {}
```

```swift
class Foo<T: Equatable>↓:Bar {}
```

```swift
class Foo<T↓:Equatable> {}
```

```swift
class Foo<T↓ : Equatable> {}
```

```swift
object.method(x: 5, y↓ : "string")
```

```swift
object.method(x↓:5, y: "string")
```

```swift
object.method(x↓:  5, y: "string")
```

```swift
func abc() { def(ghi↓:jkl) }
```

```swift
func abc(def: Void) { ghi(jkl↓:mno) }
```

```swift
class ABC { let def = ghi(jkl↓:mno) } }
```

```swift
func foo() { let dict = [1↓ : 1] }
```

```swift
switch foo {
case .bar↓ : return baz
}
```

```swift
private var action↓:(() -> Void)?
```