# Discouraged Assert

Prefer `assertionFailure()` and/or `preconditionFailure()` over `assert(false)`

* **Identifier:** discouraged_assert
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
assert(true)
```

```swift
assert(true, "foobar")
```

```swift
assert(true, "foobar", file: "toto", line: 42)
```

```swift
assert(false || true)
```

```swift
XCTAssert(false)
```

## Triggering Examples

```swift
↓assert(false)
```

```swift
↓assert(false, "foobar")
```

```swift
↓assert(false, "foobar", file: "toto", line: 42)
```

```swift
↓assert(   false    , "foobar")
```