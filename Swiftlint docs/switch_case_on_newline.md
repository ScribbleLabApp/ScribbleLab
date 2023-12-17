# Cases on Newline

Cases inside a switch should always be on a newline

* **Identifier:** switch_case_on_newline
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
  </tbody>
  </table>

## Non Triggering Examples

```swift
/*case 1: */return true
```

```swift
//case 1:
 return true
```

```swift
let x = [caseKey: value]
```

```swift
let x = [key: .default]
```

```swift
if case let .someEnum(value) = aFunction([key: 2]) { }
```

```swift
guard case let .someEnum(value) = aFunction([key: 2]) { }
```

```swift
for case let .someEnum(value) = aFunction([key: 2]) { }
```

```swift
enum Environment {
 case development
}
```

```swift
enum Environment {
 case development(url: URL)
}
```

```swift
enum Environment {
 case development(url: URL) // staging
}
```

```swift
switch foo {
    case 1:
 return true
}
```

```swift
switch foo {
    default:
 return true
}
```

```swift
switch foo {
    case let value:
 return true
}
```

```swift
switch foo {
    case .myCase: // error from network
 return true
}
```

```swift
switch foo {
    case let .myCase(value) where value > 10:
 return false
}
```

```swift
switch foo {
    case let .myCase(value)
 where value > 10:
 return false
}
```

```swift
switch foo {
    case let .myCase(code: lhsErrorCode, description: _)
 where lhsErrorCode > 10:
return false
}
```

```swift
switch foo {
    case #selector(aFunction(_:)):
 return false
}
```

```swift
do {
  let loadedToken = try tokenManager.decodeToken(from: response)
  return loadedToken
} catch { throw error }
```

## Triggering Examples

```swift
switch foo {
    ↓case 1: return true
}
```

```swift
switch foo {
    ↓case let value: return true
}
```

```swift
switch foo {
    ↓default: return true
}
```

```swift
switch foo {
    ↓case "a string": return false
}
```

```swift
switch foo {
    ↓case .myCase: return false // error from network
}
```

```swift
switch foo {
    ↓case let .myCase(value) where value > 10: return false
}
```

```swift
switch foo {
    ↓case #selector(aFunction(_:)): return false
}
```

```swift
switch foo {
    ↓case let .myCase(value)
 where value > 10: return false
}
```

```swift
switch foo {
    ↓case .first,
 .second: return false
}
```