# Protocol Property Accessors Order

When declaring properties in protocols, the order of accessors should be `get set`

* **Identifier:** protocol_property_accessors_order
* **Enabled by default:** Yes
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
protocol Foo {
 var bar: String { get set }
 }
```

```swift
protocol Foo {
 var bar: String { get }
 }
```

```swift
protocol Foo {
 var bar: String { set }
 }
```

## Triggering Examples

```swift
protocol Foo {
 var bar: String { ↓set get }
 }
```