# XCTest Specific Matcher

Prefer specific XCTest matchers over `XCTAssertEqual` and `XCTAssertNotEqual`.

* **Identifier:** xct_specific_matcher
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
  <tr>
  <td>
  matchers
  </td>
  <td>
  [one-argument-asserts, two-argument-asserts]
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
XCTAssert(foo
```

```swift
XCTAssertFalse(foo)
```

```swift
XCTAssertTrue(foo)
```

```swift
XCTAssertNil(foo)
```

```swift
XCTAssertNotNil(foo)
```

```swift
XCTAssertEqual(foo, 2)
```

```swift
XCTAssertNotEqual(foo, "false")
```

```swift
XCTAssertEqual(foo, [1, 2, 3, true])
```

```swift
XCTAssertEqual(foo, [1, 2, 3, false])
```

```swift
XCTAssertEqual(foo, [1, 2, 3, nil])
```

```swift
XCTAssertEqual(foo, [true, nil, true, nil])
```

```swift
XCTAssertEqual([1, 2, 3, true], foo)
```

```swift
XCTAssertEqual([1, 2, 3, false], foo)
```

```swift
XCTAssertEqual([1, 2, 3, nil], foo)
```

```swift
XCTAssertEqual([true, nil, true, nil], foo)
```

```swift
XCTAssertEqual(2, foo)
```

```swift
XCTAssertNotEqual("false"), foo)
```

```swift
XCTAssertEqual(false, foo?.bar)
```

```swift
XCTAssertEqual(true, foo?.bar)
```

```swift
XCTAssert(    foo  )
```

```swift
XCTAssertFalse(  foo  )
```

```swift
XCTAssertTrue(  foo  )
```

```swift
XCTAssertNil(  foo  )
```

```swift
XCTAssertNotNil(  foo  )
```

```swift
XCTAssertEqual(  foo  , 2  )
```

```swift
XCTAssertNotEqual(  foo, "false")
```

```swift
XCTAssertEqual(foo?.bar, false)
```

```swift
XCTAssertEqual(foo?.bar, true)
```

```swift
XCTAssertNil(foo?.bar)
```

```swift
XCTAssertNotNil(foo?.bar)
```

```swift
XCTAssertEqual(foo?.bar, 2)
```

```swift
XCTAssertNotEqual(foo?.bar, "false")
```

```swift
XCTAssertEqual(foo?.bar, toto())
```

```swift
XCTAssertEqual(foo?.bar, .toto(.zoo))
```

```swift
XCTAssertEqual(toto(), foo?.bar)
```

```swift
XCTAssertEqual(.toto(.zoo), foo?.bar)
```

```swift
XCTAssert(foo.self == bar)
```

```swift
XCTAssertTrue(type(of: foo) != Int.self)
```

```swift
XCTAssertTrue(a == (1, 3, 5)
```

## Triggering Examples

```swift
↓XCTAssertEqual(foo, true)
```

```swift
↓XCTAssertEqual(foo, false)
```

```swift
↓XCTAssertEqual(foo, nil)
```

```swift
↓XCTAssertNotEqual(foo, true)
```

```swift
↓XCTAssertNotEqual(foo, false)
```

```swift
↓XCTAssertNotEqual(foo, nil)
```

```swift
↓XCTAssertEqual(true, foo)
```

```swift
↓XCTAssertEqual(false, foo)
```

```swift
↓XCTAssertEqual(nil, foo)
```

```swift
↓XCTAssertNotEqual(true, foo)
```

```swift
↓XCTAssertNotEqual(false, foo)
```

```swift
↓XCTAssertNotEqual(nil, foo)
```

```swift
↓XCTAssertEqual(foo, true, "toto")
```

```swift
↓XCTAssertEqual(foo, false, "toto")
```

```swift
↓XCTAssertEqual(foo, nil, "toto")
```

```swift
↓XCTAssertNotEqual(foo, true, "toto")
```

```swift
↓XCTAssertNotEqual(foo, false, "toto")
```

```swift
↓XCTAssertNotEqual(foo, nil, "toto")
```

```swift
↓XCTAssertEqual(true, foo, "toto")
```

```swift
↓XCTAssertEqual(false, foo, "toto")
```

```swift
↓XCTAssertEqual(nil, foo, "toto")
```

```swift
↓XCTAssertNotEqual(true, foo, "toto")
```

```swift
↓XCTAssertNotEqual(false, foo, "toto")
```

```swift
↓XCTAssertNotEqual(nil, foo, "toto")
```

```swift
↓XCTAssertEqual(foo,true)
```

```swift
↓XCTAssertEqual( foo , false )
```

```swift
↓XCTAssertEqual(  foo  ,  nil  )
```

```swift
↓XCTAssertEqual(true, [1, 2, 3, true].hasNumbers())
```

```swift
↓XCTAssertEqual([1, 2, 3, true].hasNumbers(), true)
```

```swift
↓XCTAssertEqual(foo?.bar, nil)
```

```swift
↓XCTAssertNotEqual(foo?.bar, nil)
```

```swift
↓XCTAssertEqual(nil, true)
```

```swift
↓XCTAssertEqual(nil, false)
```

```swift
↓XCTAssertEqual(true, nil)
```

```swift
↓XCTAssertEqual(false, nil)
```

```swift
↓XCTAssertEqual(nil, nil)
```

```swift
↓XCTAssertEqual(true, true)
```

```swift
↓XCTAssertEqual(false, false)
```

```swift
↓XCTAssert(foo == bar)
```

```swift
↓XCTAssertTrue(   foo  ==   bar  )
```

```swift
↓XCTAssertFalse(1 == foo)
```

```swift
↓XCTAssert(foo == bar, "toto")
```

```swift
↓XCTAssert(foo != bar)
```

```swift
↓XCTAssertTrue(   foo  !=   bar  )
```

```swift
↓XCTAssertFalse(1 != foo)
```

```swift
↓XCTAssert(foo != bar, "toto")
```

```swift
↓XCTAssert(  foo   ==  nil)
```

```swift
↓XCTAssert(nil == foo
```

```swift
↓XCTAssertTrue(  foo   !=  nil)
```

```swift
↓XCTAssertFalse(nil != foo
```

```swift
↓XCTAssert(foo == nil, "toto")
```