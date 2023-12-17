# XCTFail Message

An XCTFail call should include a description of the assertion

* **Identifier:** xctfail_message
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
func testFoo() {
  XCTFail("bar")
}
```

```swift
func testFoo() {
  XCTFail(bar)
}
```

## Triggering Examples

```swift
func testFoo() {
  ↓XCTFail()
}
```

```swift
func testFoo() {
  ↓XCTFail("")
}
```