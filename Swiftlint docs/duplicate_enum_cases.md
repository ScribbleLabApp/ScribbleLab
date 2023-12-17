# Duplicate Enum Cases

Enum shouldn't contain multiple cases with the same name

* **Identifier:** duplicate_enum_cases
* **Enabled by default:** Yes
* **Supports autocorrection:** No
* **Kind:** lint
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
  error
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
enum PictureImport {
    case addImage(image: UIImage)
    case addData(data: Data)
}
```

```swift
enum A {
    case add(image: UIImage)
}
enum B {
    case add(image: UIImage)
}
```

```swift
enum Tag: String {
#if CONFIG_A
    case value = "CONFIG_A"
#elseif CONFIG_B
    case value = "CONFIG_B"
#else
    case value = "CONFIG_DEFAULT"
#endif
}
```

```swift
enum Target {
#if os(iOS)
  case file
#else
  case file(URL)
#endif
}
```

## Triggering Examples

```swift
enum PictureImport {
    case ↓add(image: UIImage)
    case addURL(url: URL)
    case ↓add(data: Data)
}
```