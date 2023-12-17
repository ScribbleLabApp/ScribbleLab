# Single Test Class

Test files should contain a single QuickSpec or XCTestCase class.

* **Identifier:** single_test_class
* **Enabled by default:** No
* **Supports autocorrection:** No
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
class FooTests {  }
```

```swift
class FooTests: QuickSpec {  }
```

```swift
class FooTests: XCTestCase {  }
```

## Triggering Examples

```swift
↓class FooTests: QuickSpec {  }
↓class BarTests: QuickSpec {  }
```

```swift
↓class FooTests: QuickSpec {  }
↓class BarTests: QuickSpec {  }
↓class TotoTests: QuickSpec {  }
```

```swift
↓class FooTests: XCTestCase {  }
↓class BarTests: XCTestCase {  }
```

```swift
↓class FooTests: XCTestCase {  }
↓class BarTests: XCTestCase {  }
↓class TotoTests: XCTestCase {  }
```

```swift
↓class FooTests: QuickSpec {  }
↓class BarTests: XCTestCase {  }
```

```swift
↓class FooTests: QuickSpec {  }
↓class BarTests: XCTestCase {  }
class TotoTests {  }
```

```swift
final ↓class FooTests: QuickSpec {  }
↓class BarTests: XCTestCase {  }
class TotoTests {  }
```