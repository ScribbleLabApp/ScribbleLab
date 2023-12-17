# Vertical Whitespace between Cases

Include a single empty line between switch cases

* **Identifier:** vertical_whitespace_between_cases
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
  </tbody>
  </table>

## Non Triggering Examples

```swift
    switch x {
    case .valid:
        print("multiple ...")
        print("... lines")

    case .invalid:
        print("multiple ...")
        print("... lines")
    }
```

```swift
    switch x {
    case .valid:
        print("x is valid")

    case .invalid:
        print("x is invalid")
    }
```

```swift
    switch x {
    case 0..<5:
        print("x is valid")

    default:
        print("x is invalid")
    }
```

```swift
switch x {

case 0..<5:
    print("x is low")

case 5..<10:
    print("x is high")

default:
    print("x is invalid")

}
```

```swift
switch x {
case 0..<5:
    print("x is low")

case 5..<10:
    print("x is high")

default:
    print("x is invalid")
}
```

```swift
switch x {
case 0..<5: print("x is low")
case 5..<10: print("x is high")
default: print("x is invalid")
}
```

```swift
switch x {    
case 1:    
    print("one")    
    
default:    
    print("not one")    
}    
```

## Triggering Examples

```swift
    switch x {
    case .valid:
        print("multiple ...")
        print("... lines")
↓    case .invalid:
        print("multiple ...")
        print("... lines")
    }
```

```swift
    switch x {
    case .valid:
        print("x is valid")
↓    case .invalid:
        print("x is invalid")
    }
```

```swift
    switch x {
    case 0..<5:
        print("x is valid")
↓    default:
        print("x is invalid")
    }
```