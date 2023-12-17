# Trailing Comma

Trailing commas in arrays and dictionaries should be avoided/enforced.

* **Identifier:** trailing_comma
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
  mandatory_comma
  </td>
  <td>
  false
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
let foo = [1, 2, 3]
```

```swift
let foo = []
```

```swift
let foo = [:]
```

```swift
let foo = [1: 2, 2: 3]
```

```swift
let foo = [Void]()
```

```swift
let example = [ 1,
 2
 // 3,
]
```

```swift
foo([1: "\(error)"])
```

```swift
let foo = [Int]()
```

## Triggering Examples

```swift
let foo = [1, 2, 3↓,]
```

```swift
let foo = [1, 2, 3↓, ]
```

```swift
let foo = [1, 2, 3   ↓,]
```

```swift
let foo = [1: 2, 2: 3↓, ]
```

```swift
struct Bar {
 let foo = [1: 2, 2: 3↓, ]
}
```

```swift
let foo = [1, 2, 3↓,] + [4, 5, 6↓,]
```

```swift
let example = [ 1,
2↓,
 // 3,
]
```

```swift
let foo = ["אבג", "αβγ", "🇺🇸"↓,]
```

```swift
class C {
 #if true
 func f() {
 let foo = [1, 2, 3↓,]
 }
 #endif
}
```

```swift
foo([1: "\(error)"↓,])
```