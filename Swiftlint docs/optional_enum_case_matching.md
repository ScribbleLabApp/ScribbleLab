# Optional Enum Case Match

Matching an enum case against an optional enum without '?' is supported on Swift 5.1 and above

* **Identifier:** optional_enum_case_matching
* **Enabled by default:** No
* **Supports autocorrection:** Yes
* **Kind:** style
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.1.0
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
 case .bar: break
 case .baz: break
 default: break
}
```

```swift
switch foo {
 case (.bar, .baz): break
 case (.bar, _): break
 case (_, .baz): break
 default: break
}
```

```swift
switch (x, y) {
case (.c, _?):
    break
case (.c, nil):
    break
case (_, _):
    break
}
```

## Triggering Examples

```swift
switch foo {
 case .bar↓?: break
 case .baz: break
 default: break
}
```

```swift
switch foo {
 case Foo.bar↓?: break
 case .baz: break
 default: break
}
```

```swift
switch foo {
 case .bar↓?, .baz↓?: break
 default: break
}
```

```swift
switch foo {
 case .bar↓? where x > 1: break
 case .baz: break
 default: break
}
```

```swift
switch foo {
 case (.bar↓?, .baz↓?): break
 case (.bar↓?, _): break
 case (_, .bar↓?): break
 default: break
}
```