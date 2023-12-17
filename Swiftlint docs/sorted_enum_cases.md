# Sorted Enum Cases

Enum cases should be sorted

* **Identifier:** sorted_enum_cases
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
enum foo {
    case a
    case b
    case c
}
```

```swift
enum foo {
    case a, b, c
}
```

```swift
enum foo {
    case a
    case b, c
}
```

```swift
enum foo {
    case a(foo: Foo)
    case b(String), c
}
```

```swift
@frozen
enum foo {
    case b
    case a
    case c, f, d
}
```

## Triggering Examples

```swift
enum foo {
    ↓case b
    ↓case a
    case c
}
```

```swift
enum foo {
    case ↓b, ↓a, c
}
```

```swift
enum foo {
    ↓case b, c
    ↓case a
}
```

```swift
enum foo {
    case a
    case b, ↓d, ↓c
}
```

```swift
enum foo {
    case a(foo: Foo)
    case ↓c, ↓b(String)
}
```