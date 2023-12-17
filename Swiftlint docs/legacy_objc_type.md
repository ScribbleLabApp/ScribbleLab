# Legacy Objective-C Reference Type

Prefer Swift value types to bridged Objective-C reference types

* **Identifier:** legacy_objc_type
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
var array = Array<Int>()
```

```swift
var calendar: Calendar? = nil
```

```swift
var formatter: NSDataDetector
```

```swift
var className: String = NSStringFromClass(MyClass.self)
```

```swift
_ = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
```

```swift
_ = Notification.Name("com.apple.Music.playerInfo")
```

## Triggering Examples

```swift
var array = ↓NSArray()
```

```swift
var calendar: ↓NSCalendar? = nil
```

```swift
_ = ↓NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData
```

```swift
_ = ↓NSNotification.Name("com.apple.Music.playerInfo")
```

```swift
let keyValuePair: (Int) -> (↓NSString, ↓NSString) = {
  let n = "\($0)" as ↓NSString; return (n, n)
}
dictionary = [↓NSString: ↓NSString](uniqueKeysWithValues:
  (1...10_000).lazy.map(keyValuePair))
```

```swift
extension Foundation.Notification.Name {
    static var reachabilityChanged: Foundation.↓NSNotification.Name {
        return Foundation.Notification.Name("org.wordpress.reachability.changed")
    }
}
```