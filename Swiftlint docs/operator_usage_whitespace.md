# Operator Usage Whitespace

Operators should be surrounded by a single whitespace when they are being used

* **Identifier:** operator_usage_whitespace
* **Enabled by default:** No
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
  lines_look_around
  </td>
  <td>
  2
  </td>
  </tr>
  <tr>
  <td>
  skip_aligned_constants
  </td>
  <td>
  true
  </td>
  </tr>
  <tr>
  <td>
  allowed_no_space_operators
  </td>
  <td>
  [&quot;...&quot;, &quot;..<&quot;]
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
let foo = 1 + 2
```

```swift
let foo = 1 > 2
```

```swift
let foo = !false
```

```swift
let foo: Int?
```

```swift
let foo: Array<String>
```

```swift
let model = CustomView<Container<Button>, NSAttributedString>()
```

```swift
let foo: [String]
```

```swift
let foo = 1 + 
  2
```

```swift
let range = 1...3
```

```swift
let range = 1 ... 3
```

```swift
let range = 1..<3
```

```swift
#if swift(>=3.0)
    foo()
#endif
```

```swift
array.removeAtIndex(-200)
```

```swift
let name = "image-1"
```

```swift
button.setImage(#imageLiteral(resourceName: "image-1"), for: .normal)
```

```swift
let doubleValue = -9e-11
```

```swift
let foo = GenericType<(UIViewController) -> Void>()
```

```swift
let foo = Foo<Bar<T>, Baz>()
```

```swift
let foo = SignalProducer<Signal<Value, Error>, Error>([ self.signal, next ]).flatten(.concat)
```

```swift
"let foo =  1"
```

```swift
  enum Enum {
  case hello   = 1
  case hello2  = 1
  }
```

```swift
let something = Something<GenericParameter1,
                          GenericParameter2>()
```

```swift
return path.flatMap { path in
    return compileCommands[path] ??
        compileCommands[path.path(relativeTo: FileManager.default.currentDirectoryPath)]
}
```

```swift
internal static func == (lhs: Vertex, rhs: Vertex) -> Bool {
    return lhs.filePath == rhs.filePath
        && lhs.originalRemoteString == rhs.originalRemoteString
        && lhs.rootDirectory == rhs.rootDirectory
}
```

```swift
internal static func == (lhs: Vertex, rhs: Vertex) -> Bool {
    return lhs.filePath == rhs.filePath &&
        lhs.originalRemoteString == rhs.originalRemoteString &&
        lhs.rootDirectory == rhs.rootDirectory
}
```

```swift
private static let pattern =
    "\\S\(mainPatternGroups)" + // Regexp will match if expression not begin with comma
    "|" +                       // or
    "\(mainPatternGroups)"      // Regexp will match if expression begins with comma
```

```swift
private static let pattern =
    "\\S\(mainPatternGroups)" + // Regexp will match if expression not begin with comma
    "|"                       + // or
    "\(mainPatternGroups)"      // Regexp will match if expression begins with comma
```

```swift
typealias Foo = Bar
```

```swift
protocol A {
    associatedtype B = C
}
```

```swift
tabbedViewController.title = nil
```

## Triggering Examples

```swift
let foo = 1↓+2
```

```swift
let foo = 1↓   + 2
```

```swift
let foo = 1↓   +    2
```

```swift
let foo = 1↓ +    2
```

```swift
let foo↓=1↓+2
```

```swift
let foo↓=1 + 2
```

```swift
let foo↓=bar
```

```swift
let range = 1↓ ..<  3
```

```swift
let foo = bar↓   ?? 0
```

```swift
let foo = bar↓ !=  0
```

```swift
let foo = bar↓ !==  bar2
```

```swift
let v8 = Int8(1)↓  << 6
```

```swift
let v8 = 1↓ <<  (6)
```

```swift
let v8 = 1↓ <<  (6)
 let foo = 1 > 2
```

```swift
let foo↓  = [1]
```

```swift
let foo↓  = "1"
```

```swift
let foo↓ =  "1"
```

```swift
  enum Enum {
  case one↓  =  1
  case two  = 1
  }
```

```swift
  enum Enum {
  case one  = 1
  case two↓  =  1
  }
```

```swift
  enum Enum {
  case one↓   = 1
  case two↓  = 1
  }
```

```swift
typealias Foo↓ =  Bar
```

```swift
protocol A {
    associatedtype B↓  = C
}
```

```swift
tabbedViewController.title↓  = nil
```

```swift
let foo = bar ? 0↓:1
```

```swift
let foo = bar↓ ?   0 : 1
```