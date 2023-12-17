# Redundant String Enum Value

String enum values can be omitted when they are equal to the enumcase name

* **Identifier:** redundant_string_enum_value
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
enum Numbers: String {
  case one
  case two
}
```

```swift
enum Numbers: Int {
  case one = 1
  case two = 2
}
```

```swift
enum Numbers: String {
  case one = "ONE"
  case two = "TWO"
}
```

```swift
enum Numbers: String {
  case one = "ONE"
  case two = "two"
}
```

```swift
enum Numbers: String {
  case one, two
}
```

## Triggering Examples

```swift
enum Numbers: String {
  case one = ↓"one"
  case two = ↓"two"
}
```

```swift
enum Numbers: String {
  case one = ↓"one", two = ↓"two"
}
```

```swift
enum Numbers: String {
  case one, two = ↓"two"
}
```