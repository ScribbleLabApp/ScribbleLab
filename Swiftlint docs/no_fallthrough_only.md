# No Fallthrough only

Fallthroughs can only be used if the `case` contains at least one other statement

* **Identifier:** no_fallthrough_only
* **Enabled by default:** Yes
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
switch myvar {
case 1:
    var a = 1
    fallthrough
case 2:
    var a = 2
}
```

```swift
switch myvar {
case "a":
    var one = 1
    var two = 2
    fallthrough
case "b": /* comment */
    var three = 3
}
```

```swift
switch myvar {
case 1:
    let one = 1
case 2:
    // comment
    var two = 2
}
```

```swift
switch myvar {
case MyFunc(x: [1, 2, YourFunc(a: 23)], y: 2):
    var three = 3
    fallthrough
default:
    var three = 4
}
```

```swift
switch myvar {
case .alpha:
    var one = 1
case .beta:
    var three = 3
    fallthrough
default:
    var four = 4
}
```

```swift
let aPoint = (1, -1)
switch aPoint {
case let (x, y) where x == y:
    let A = "A"
case let (x, y) where x == -y:
    let B = "B"
    fallthrough
default:
    let C = "C"
}
```

```swift
switch myvar {
case MyFun(with: { $1 }):
    let one = 1
    fallthrough
case "abc":
    let two = 2
}
```

```swift
switch enumInstance {
case .caseA:
    print("it's a")
case .caseB:
    fallthrough
@unknown default:
    print("it's not a")
}
```

## Triggering Examples

```swift
switch myvar {
case 1:
    ↓fallthrough
case 2:
    var a = 1
}
```

```swift
switch myvar {
case 1:
    var a = 2
case 2:
    ↓fallthrough
case 3:
    var a = 3
}
```

```swift
switch myvar {
case 1: // comment
    ↓fallthrough
}
```

```swift
switch myvar {
case 1: /* multi
    line
    comment */
    ↓fallthrough
case 2:
    var a = 2
}
```

```swift
switch myvar {
case MyFunc(x: [1, 2, YourFunc(a: 23)], y: 2):
    ↓fallthrough
default:
    var three = 4
}
```

```swift
switch myvar {
case .alpha:
    var one = 1
case .beta:
    ↓fallthrough
case .gamma:
    var three = 3
default:
    var four = 4
}
```

```swift
let aPoint = (1, -1)
switch aPoint {
case let (x, y) where x == y:
    let A = "A"
case let (x, y) where x == -y:
    ↓fallthrough
default:
    let B = "B"
}
```

```swift
switch myvar {
case MyFun(with: { $1 }):
    ↓fallthrough
case "abc":
    let two = 2
}
```