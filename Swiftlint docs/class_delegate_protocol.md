# Class Delegate Protocol

Delegate protocols should be class-only so they can be weakly referenced

* **Identifier:** class_delegate_protocol
* **Enabled by default:** Yes
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
  </tbody>
  </table>

## Non Triggering Examples

```swift
protocol FooDelegate: class {}
```

```swift
protocol FooDelegate: class, BarDelegate {}
```

```swift
protocol Foo {}
```

```swift
class FooDelegate {}
```

```swift
@objc protocol FooDelegate {}
```

```swift
@objc(MyFooDelegate)
 protocol FooDelegate {}
```

```swift
protocol FooDelegate: BarDelegate {}
```

```swift
protocol FooDelegate: AnyObject {}
```

```swift
protocol FooDelegate: NSObjectProtocol {}
```

```swift
protocol FooDelegate where Self: BarDelegate {}
```

```swift
protocol FooDelegate where Self: AnyObject {}
```

```swift
protocol FooDelegate where Self: NSObjectProtocol {}
```

## Triggering Examples

```swift
↓protocol FooDelegate {}
```

```swift
↓protocol FooDelegate: Bar {}
```

```swift
↓protocol FooDelegate where Self: StringProtocol {}
```