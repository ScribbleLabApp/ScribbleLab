# Empty XCTest Method

Empty XCTest method should be avoided

* **Identifier:** empty_xctest_method
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
class TotoTests: XCTestCase {
    var foobar: Foobar?

    override func setUp() {
        super.setUp()
        foobar = Foobar()
    }

    override func setUpWithError() throws {
        foobar = nil
    }

    override func tearDown() {
        foobar = nil
        super.tearDown()
    }

    func testFoo() {
        XCTAssertTrue(foobar?.foo)
    }

    func testBar() {
        // comment...

        XCTAssertFalse(foobar?.bar)

        // comment...
    }

    func testBaz() {
        _ = 4 + 4
    }
}
```

```swift
class Foobar {
    func setUp() {}

    func tearDown() {}

    func testFoo() {}
}
```

```swift
class TotoTests: XCTestCase {
    func setUp(with object: Foobar) {}

    func tearDown(object: Foobar) {}

    func testFoo(_ foo: Foobar) {}

    func testBar(bar: (String) -> Int) {}
}
```

```swift
class TotoTests: XCTestCase {
    func testFoo() { XCTAssertTrue(foobar?.foo) }

    func testBar() { XCTAssertFalse(foobar?.bar) }
}
```

```swift
class TotoTests: XCTestCase {
    override class var runsForEachTargetApplicationUIConfiguration: Bool { true }

    static var allTests = [("testFoo", testFoo)]

    func testFoo() { XCTAssert(true) }
}
```

## Triggering Examples

```swift
class TotoTests: XCTestCase {
    override ↓func setUp() {
    }

    override ↓func tearDown() {

    }

    ↓func testFoo() {


    }

    ↓func testBar() {



    }

    func helperFunction() {
    }
}
```

```swift
class TotoTests: XCTestCase {
    override ↓func setUp() {}

    override ↓func tearDown() {}

    ↓func testFoo() {}

    func helperFunction() {}
}
```

```swift
class TotoTests: XCTestCase {
    override ↓func setUp() {
        // comment...
    }

    override ↓func tearDown() {
        // comment...
        // comment...
    }

    ↓func testFoo() {
        // comment...

        // comment...

        // comment...
    }

    ↓func testBar() {
        /*
         * comment...
         *
         * comment...
         *
         * comment...
         */
    }

    func helperFunction() {
    }
}
```

```swift
class FooTests: XCTestCase {
    override ↓func setUp() {}
}

class BarTests: XCTestCase {
    ↓func testFoo() {}
}
```