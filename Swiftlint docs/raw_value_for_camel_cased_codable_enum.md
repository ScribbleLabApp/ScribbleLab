# Raw Value for Camel Cased Codable Enum

Camel cased cases of Codable String enums should have raw values

* **Identifier:** raw_value_for_camel_cased_codable_enum
* **Enabled by default:** No
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
  warning
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
enum Numbers: Codable {
  case int(Int)
  case short(Int16)
}
```

```swift
enum Numbers: Int, Codable {
  case one = 1
  case two = 2
}
```

```swift
enum Numbers: Double, Codable {
  case one = 1.1
  case two = 2.2
}
```

```swift
enum Numbers: String, Codable {
  case one = "one"
  case two = "two"
}
```

```swift
enum Status: String, Codable {
    case OK, ACCEPTABLE
}
```

```swift
enum Status: String, Codable {
    case ok
    case maybeAcceptable = "maybe_acceptable"
}
```

```swift
enum Status: String {
    case ok
    case notAcceptable
    case maybeAcceptable = "maybe_acceptable"
}
```

```swift
enum Status: Int, Codable {
    case ok
    case notAcceptable
    case maybeAcceptable = -1
}
```

## Triggering Examples

```swift
enum Status: String, Codable {
    case ok
    case ↓notAcceptable
    case maybeAcceptable = "maybe_acceptable"
}
```

```swift
enum Status: String, Decodable {
   case ok
   case ↓notAcceptable
   case maybeAcceptable = "maybe_acceptable"
}
```

```swift
enum Status: String, Encodable {
   case ok
   case ↓notAcceptable
   case maybeAcceptable = "maybe_acceptable"
}
```

```swift
enum Status: String, Codable {
    case ok
    case ↓notAcceptable
    case maybeAcceptable = "maybe_acceptable"
}
```