# Pattern Matching Keywords

Combine multiple pattern matching bindings by moving keywords out of tuples

* **Identifier:** pattern_matching_keywords
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
switch foo {
    default: break
}
```

```swift
switch foo {
    case 1: break
}
```

```swift
switch foo {
    case bar: break
}
```

```swift
switch foo {
    case let (x, y): break
}
```

```swift
switch foo {
    case .foo(let x): break
}
```

```swift
switch foo {
    case let .foo(x, y): break
}
```

```swift
switch foo {
    case .foo(let x), .bar(let x): break
}
```

```swift
switch foo {
    case .foo(let x, var y): break
}
```

```swift
switch foo {
    case var (x, y): break
}
```

```swift
switch foo {
    case .foo(var x): break
}
```

```swift
switch foo {
    case var .foo(x, y): break
}
```

## Triggering Examples

```swift
switch foo {
    case (↓let x,  ↓let y): break
}
```

```swift
switch foo {
    case (↓let x,  ↓let y, .foo): break
}
```

```swift
switch foo {
    case (↓let x,  ↓let y, _): break
}
```

```swift
switch foo {
    case .foo(↓let x, ↓let y): break
}
```

```swift
switch foo {
    case (.yamlParsing(↓let x), .yamlParsing(↓let y)): break
}
```

```swift
switch foo {
    case (↓var x,  ↓var y): break
}
```

```swift
switch foo {
    case .foo(↓var x, ↓var y): break
}
```

```swift
switch foo {
    case (.yamlParsing(↓var x), .yamlParsing(↓var y)): break
}
```