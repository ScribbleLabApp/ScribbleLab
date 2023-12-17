# Prefer Nimble

Prefer Nimble matchers over XCTAssert functions

* **Identifier:** prefer_nimble
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
expect(foo) == 1
```

```swift
expect(foo).to(equal(1))
```

## Triggering Examples

```swift
↓XCTAssertTrue(foo)
```

```swift
↓XCTAssertEqual(foo, 2)
```

```swift
↓XCTAssertNotEqual(foo, 2)
```

```swift
↓XCTAssertNil(foo)
```

```swift
↓XCTAssert(foo)
```

```swift
↓XCTAssertGreaterThan(foo, 10)
```