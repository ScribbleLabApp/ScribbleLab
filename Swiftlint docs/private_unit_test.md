# Private Unit Test

Unit tests marked private are silently skipped

* **Identifier:** private_unit_test
* **Enabled by default:** Yes
* **Supports autocorrection:** Yes
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
  <tr>
  <td>
  regex
  </td>
  <td>
  &quot;XCTestCase&quot;
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
class FooTest: XCTestCase {
    func test1() {}
    internal func test2() {}
    public func test3() {}
}
```

```swift
internal class FooTest: XCTestCase {
    func test1() {}
    internal func test2() {}
    public func test3() {}
}
```

```swift
public class FooTest: XCTestCase {
    func test1() {}
    internal func test2() {}
    public func test3() {}
}
```

```swift
@objc private class FooTest: XCTestCase {
    @objc private func test1() {}
    internal func test2() {}
    public func test3() {}
}
```

```swift
private class Foo: NSObject {
    func test1() {}
    internal func test2() {}
    public func test3() {}
}
```

```swift
private class Foo {
    func test1() {}
    internal func test2() {}
    public func test3() {}
}
```

```swift
public class FooTest: XCTestCase {
    private func test1(param: Int) {}
    private func test2() -> String { "" }
    private func atest() {}
    private static func test3() {}
}
```

## Triggering Examples

```swift
private ↓class FooTest: XCTestCase {
    func test1() {}
    internal func test2() {}
    public func test3() {}
    private func test4() {}
}
```

```swift
class FooTest: XCTestCase {
    func test1() {}
    internal func test2() {}
    public func test3() {}
    private ↓func test4() {}
}
```

```swift
internal class FooTest: XCTestCase {
    func test1() {}
    internal func test2() {}
    public func test3() {}
    private ↓func test4() {}
}
```

```swift
public class FooTest: XCTestCase {
    func test1() {}
    internal func test2() {}
    public func test3() {}
    private ↓func test4() {}
}
```