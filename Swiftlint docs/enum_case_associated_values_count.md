# Enum Case Associated Values Count

The number of associated values in an enum case should be low.

* **Identifier:** enum_case_associated_values_count
* **Enabled by default:** No
* **Supports autocorrection:** No
* **Kind:** metrics
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
  warning
  </td>
  <td>
  5
  </td>
  </tr>
  <tr>
  <td>
  error
  </td>
  <td>
  6
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
enum Employee {
    case fullTime(name: String, retirement: Date, designation: String, contactNumber: Int)
    case partTime(name: String, age: Int, contractEndDate: Date)
}
```

```swift
enum Barcode {
    case upc(Int, Int, Int, Int)
}
```

## Triggering Examples

```swift
enum Employee {
    case ↓fullTime(name: String, retirement: Date, age: Int, designation: String, contactNumber: Int)
    case ↓partTime(name: String, contractEndDate: Date, age: Int, designation: String, contactNumber: Int)
}
```

```swift
enum Barcode {
    case ↓upc(Int, Int, Int, Int, Int, Int)
}
```