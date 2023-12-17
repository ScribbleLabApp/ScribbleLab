# Function Default Parameter at End

Prefer to locate parameters with defaults toward the end of the parameter list

* **Identifier:** function_default_parameter_at_end
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
func foo(baz: String, bar: Int = 0) {}
```

```swift
func foo(x: String, y: Int = 0, z: CGFloat = 0) {}
```

```swift
func foo(bar: String, baz: Int = 0, z: () -> Void) {}
```

```swift
func foo(bar: String, z: () -> Void, baz: Int = 0) {}
```

```swift
func foo(bar: Int = 0) {}
```

```swift
func foo() {}
```

```swift
class A: B {
  override func foo(bar: Int = 0, baz: String) {}
```

```swift
func foo(bar: Int = 0, completion: @escaping CompletionHandler) {}
```

```swift
func foo(a: Int, b: CGFloat = 0) {
  let block = { (error: Error?) in }
}
```

```swift
func foo(a: String, b: String? = nil,
         c: String? = nil, d: @escaping AlertActionHandler = { _ in }) {}
```

```swift
override init?(for date: Date = Date(), coordinate: CLLocationCoordinate2D) {}
```

```swift
func handleNotification(_ userInfo: NSDictionary,
                        userInteraction: Bool = false,
                        completionHandler: ((UIBackgroundFetchResult) -> Void)?) {}
```

```swift
func write(withoutNotifying tokens: [NotificationToken] =  {}, _ block: (() throws -> Int)) {}
```

## Triggering Examples

```swift
↓func foo(bar: Int = 0, baz: String) {}
```

```swift
private ↓func foo(bar: Int = 0, baz: String) {}
```

```swift
public ↓init?(for date: Date = Date(), coordinate: CLLocationCoordinate2D) {}
```