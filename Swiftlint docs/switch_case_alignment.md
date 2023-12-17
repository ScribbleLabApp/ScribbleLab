# Switch and Case Statement Alignment

Case statements should vertically align with their closing brace, or indented if configured otherwise.

* **Identifier:** switch_case_alignment
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
  severity
  </td>
  <td>
  warning
  </td>
  </tr>
  <tr>
  <td>
  indented_cases
  </td>
  <td>
  false
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
switch someBool {
case true: // case 1
    print('red')
case false:
    /*
    case 2
    */
    if case let .someEnum(val) = someFunc() {
        print('blue')
    }
}
enum SomeEnum {
    case innocent
}
```

```swift
if aBool {
    switch someBool {
    case true:
        print('red')
    case false:
        print('blue')
    }
}
```

```swift
switch someInt {
// comments ignored
case 0:
    // zero case
    print('Zero')
case 1:
    print('One')
default:
    print('Some other number')
}
```

```swift
func f() -> Int {
    return switch i {
    case 1: 1
    default: 2
    }
}
```

## Triggering Examples

```swift
switch someBool {
    ↓case true:
        print("red")
    ↓case false:
        print("blue")
}
```

```swift
if aBool {
    switch someBool {
        ↓case true:
            print('red')
        ↓case false:
            print('blue')
    }
}
```

```swift
switch someInt {
    ↓case 0:
        print('Zero')
    ↓case 1:
        print('One')
    ↓default:
        print('Some other number')
}
```

```swift
let a = switch i {
    ↓case 1: 1
    ↓default: 2
}
```

```swift
switch someBool {
case true:
    print('red')
    ↓case false:
        print('blue')
}
```

```swift
if aBool {
    switch someBool {
        ↓case true:
        print('red')
    case false:
    print('blue')
    }
}
```

```swift
let a = switch i {
case 1: 1
    ↓default: 2
}
```