# Identifier Name

Identifier names should only contain alphanumeric characters and start with a lowercase character or should only contain capital letters. In an exception to the above, variable names may start with a capital letter when they are declared as static. Variable names should not be too long or too short.

* **Identifier:** identifier_name
* **Enabled by default:** Yes
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
  min_length
  </td>
  <td>
  <table>
  <thead>
  <tr><th>Key</th><th>Value</th></tr>
  </thead>
  <tbody>
  <tr>
  <td>
  warning
  </td>
  <td>
  3
  </td>
  </tr>
  <tr>
  <td>
  error
  </td>
  <td>
  2
  </td>
  </tr>
  </tbody>
  </table>
  </td>
  </tr>
  <tr>
  <td>
  max_length
  </td>
  <td>
  <table>
  <thead>
  <tr><th>Key</th><th>Value</th></tr>
  </thead>
  <tbody>
  <tr>
  <td>
  warning
  </td>
  <td>
  40
  </td>
  </tr>
  <tr>
  <td>
  error
  </td>
  <td>
  60
  </td>
  </tr>
  </tbody>
  </table>
  </td>
  </tr>
  <tr>
  <td>
  excluded
  </td>
  <td>
  [&quot;^id$&quot;]
  </td>
  </tr>
  <tr>
  <td>
  allowed_symbols
  </td>
  <td>
  []
  </td>
  </tr>
  <tr>
  <td>
  unallowed_symbols_severity
  </td>
  <td>
  error
  </td>
  </tr>
  <tr>
  <td>
  validates_start_with_lowercase
  </td>
  <td>
  error
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
let myLet = 0
```

```swift
var myVar = 0
```

```swift
private let _myLet = 0
```

```swift
class Abc { static let MyLet = 0 }
```

```swift
let URL: NSURL? = nil
```

```swift
let XMLString: String? = nil
```

```swift
override var i = 0
```

```swift
enum Foo { case myEnum }
```

```swift
func isOperator(name: String) -> Bool
```

```swift
func typeForKind(_ kind: SwiftDeclarationKind) -> String
```

```swift
func == (lhs: SyntaxToken, rhs: SyntaxToken) -> Bool
```

```swift
override func IsOperator(name: String) -> Bool
```

```swift
enum Foo { case `private` }
```

```swift
enum Foo { case value(String) }
```

```swift
class Foo {
   static let Bar = 0
}
```

```swift
class Foo {
   static var Bar = 0
}
```

## Triggering Examples

```swift
↓let _myLet = 0
```

```swift
private ↓let myLet_ = 0
```

```swift
↓let myExtremelyVeryVeryVeryVeryVeryVeryLongLet = 0
```

```swift
↓var myExtremelyVeryVeryVeryVeryVeryVeryLongVar = 0
```

```swift
private ↓let _myExtremelyVeryVeryVeryVeryVeryVeryLongLet = 0
```

```swift
↓let i = 0
```

```swift
↓var aa = 0
```

```swift
private ↓let _i = 0
```