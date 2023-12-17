# Force Unwrapping

Force unwrapping should be avoided

* **Identifier:** force_unwrapping
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
if let url = NSURL(string: query)
```

```swift
navigationController?.pushViewController(viewController, animated: true)
```

```swift
let s as! Test
```

```swift
try! canThrowErrors()
```

```swift
let object: Any!
```

```swift
@IBOutlet var constraints: [NSLayoutConstraint]!
```

```swift
setEditing(!editing, animated: true)
```

```swift
navigationController.setNavigationBarHidden(!navigationController.navigationBarHidden, animated: true)
```

```swift
if addedToPlaylist && (!self.selectedFilters.isEmpty || self.searchBar?.text?.isEmpty == false) {}
```

```swift
print("\(xVar)!")
```

```swift
var test = (!bar)
```

```swift
var a: [Int]!
```

```swift
private var myProperty: (Void -> Void)!
```

```swift
func foo(_ options: [AnyHashable: Any]!) {
```

```swift
func foo() -> [Int]!
```

```swift
func foo() -> [AnyHashable: Any]!
```

```swift
func foo() -> [Int]! { return [] }
```

```swift
return self
```

## Triggering Examples

```swift
let url = NSURL(string: query)↓!
```

```swift
navigationController↓!.pushViewController(viewController, animated: true)
```

```swift
let unwrapped = optional↓!
```

```swift
return cell↓!
```

```swift
let url = NSURL(string: "http://www.google.com")↓!
```

```swift
let dict = ["Boooo": "👻"]
func bla() -> String {
    return dict["Boooo"]↓!
}
```

```swift
let dict = ["Boooo": "👻"]
func bla() -> String {
    return dict["Boooo"]↓!.contains("B")
}
```

```swift
let a = dict["abc"]↓!.contains("B")
```

```swift
dict["abc"]↓!.bar("B")
```

```swift
if dict["a"]↓!↓!↓!↓! {}
```

```swift
var foo: [Bool]! = dict["abc"]↓!
```

```swift
realm.objects(SwiftUTF8Object.self).filter("%K == %@", "柱нǢкƱаم👍", utf8TestString).first↓!
```

```swift
context("abc") {
  var foo: [Bool]! = dict["abc"]↓!
}
```

```swift
open var computed: String { return foo.bar↓! }
```

```swift
return self↓!
```

```swift
[1, 3, 5, 6].first { $0.isMultiple(of: 2) }↓!
```

```swift
map["a"]↓!↓!
```