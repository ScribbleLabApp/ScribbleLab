# Required Enum Case

Enums conforming to a specified protocol must implement a specific case(s).

* **Identifier:** required_enum_case
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
  {Protocol Name}
  </td>
  <td>
  <table>
  <thead>
  <tr><th>Key</th><th>Value</th></tr>
  </thead>
  <tbody>
  <tr>
  <td>
  {Case Name 1}
  </td>
  <td>
  {warning|error}
  </td>
  </tr>
  <tr>
  <td>
  {Case Name 2}
  </td>
  <td>
  {warning|error}
  </td>
  </tr>
  </tbody>
  </table>
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
enum MyNetworkResponse: String, NetworkResponsable {
    case success, error, notConnected
}
```

```swift
enum MyNetworkResponse: String, NetworkResponsable {
    case success, error, notConnected(error: Error)
}
```

```swift
enum MyNetworkResponse: String, NetworkResponsable {
    case success
    case error
    case notConnected
}
```

```swift
enum MyNetworkResponse: String, NetworkResponsable {
    case success
    case error
    case notConnected(error: Error)
}
```

## Triggering Examples

```swift
↓enum MyNetworkResponse: String, NetworkResponsable {
    case success, error
}
```

```swift
↓enum MyNetworkResponse: String, NetworkResponsable {
    case success, error
}
```

```swift
↓enum MyNetworkResponse: String, NetworkResponsable {
    case success
    case error
}
```

```swift
↓enum MyNetworkResponse: String, NetworkResponsable {
    case success
    case error
}
```