# Balanced XCTest Life Cycle

Test classes must implement balanced setUp and tearDown methods

* **Identifier:** balanced_xctest_lifecycle
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
  <tr>
  <td>
  test_parent_classes
  </td>
  <td>
  [&quot;QuickSpec&quot;, &quot;XCTestCase&quot;]
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
final class FooTests: XCTestCase {
    override func setUp() {}
    override func tearDown() {}
}
```

```swift
final class FooTests: XCTestCase {
    override func setUpWithError() throws {}
    override func tearDown() {}
}
```

```swift
final class FooTests: XCTestCase {
    override func setUp() {}
    override func tearDownWithError() throws {}
}
```

```swift
final class FooTests: XCTestCase {
    override func setUpWithError() throws {}
    override func tearDownWithError() throws {}
}
final class BarTests: XCTestCase {
    override func setUpWithError() throws {}
    override func tearDownWithError() throws {}
}
```

```swift
struct FooTests {
    override func setUp() {}
}
class BarTests {
    override func setUpWithError() throws {}
}
```

```swift
final class FooTests: XCTestCase {
    override func setUpAlLExamples() {}
}
```

```swift
final class FooTests: XCTestCase {
    class func setUp() {}
    class func tearDown() {}
}
```

## Triggering Examples

```swift
final class ↓FooTests: XCTestCase {
    override func setUp() {}
}
```

```swift
final class ↓FooTests: XCTestCase {
    override func setUpWithError() throws {}
}
```

```swift
final class FooTests: XCTestCase {
    override func setUp() {}
    override func tearDownWithError() throws {}
}
final class ↓BarTests: XCTestCase {
    override func setUpWithError() throws {}
}
```

```swift
final class ↓FooTests: XCTestCase {
    class func tearDown() {}
}
```

```swift
final class ↓FooTests: XCTestCase {
    override func tearDown() {}
}
```

```swift
final class ↓FooTests: XCTestCase {
    override func tearDownWithError() throws {}
}
```

```swift
final class FooTests: XCTestCase {
    override func setUp() {}
    override func tearDownWithError() throws {}
}
final class ↓BarTests: XCTestCase {
    override func tearDownWithError() throws {}
}
```