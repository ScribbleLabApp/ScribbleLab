# Nimble Operator

Prefer Nimble operator overloads over free matcher functions

* **Identifier:** nimble_operator
* **Enabled by default:** No
* **Supports autocorrection:** Yes
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
expect(seagull.squawk) != "Hi!"
```

```swift
expect("Hi!") == "Hi!"
```

```swift
expect(10) > 2
```

```swift
expect(10) >= 10
```

```swift
expect(10) < 11
```

```swift
expect(10) <= 10
```

```swift
expect(x) === x
```

```swift
expect(10) == 10
```

```swift
expect(success) == true
```

```swift
expect(value) == nil
```

```swift
expect(value) != nil
```

```swift
expect(object.asyncFunction()).toEventually(equal(1))
```

```swift
expect(actual).to(haveCount(expected))
```

```swift
foo.method {
    expect(value).to(equal(expectedValue), description: "Failed")
    return Bar(value: ())
}
```

## Triggering Examples

```swift
↓expect(seagull.squawk).toNot(equal("Hi"))
```

```swift
↓expect(12).toNot(equal(10))
```

```swift
↓expect(10).to(equal(10))
```

```swift
↓expect(10, line: 1).to(equal(10))
```

```swift
↓expect(10).to(beGreaterThan(8))
```

```swift
↓expect(10).to(beGreaterThanOrEqualTo(10))
```

```swift
↓expect(10).to(beLessThan(11))
```

```swift
↓expect(10).to(beLessThanOrEqualTo(10))
```

```swift
↓expect(x).to(beIdenticalTo(x))
```

```swift
↓expect(success).to(beTrue())
```

```swift
↓expect(success).to(beFalse())
```

```swift
↓expect(value).to(beNil())
```

```swift
↓expect(value).toNot(beNil())
```

```swift
expect(10) > 2
 ↓expect(10).to(beGreaterThan(2))
```