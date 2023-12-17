# Discarded Notification Center Observer

When registering for a notification using a block, the opaque observer that is returned should be stored so it can be removed later

* **Identifier:** discarded_notification_center_observer
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
  </tbody>
  </table>

## Non Triggering Examples

```swift
let foo = nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil) { }
```

```swift
let foo = nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil, using: { })
```

```swift
func foo() -> Any {
    return nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil, using: { })
}
```

```swift
var obs: [Any?] = []
obs.append(nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil, using: { }))
```

```swift
var obs: [String: Any?] = []
obs["foo"] = nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil, using: { })
```

```swift
var obs: [Any?] = []
obs.append(nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil, using: { }))
```

```swift
func foo(_ notif: Any) {
   obs.append(notif)
}
foo(nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil, using: { }))
```

```swift
var obs: [NSObjectProtocol] = [
   nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil, using: { }),
   nc.addObserver(forName: .CKAccountChanged, object: nil, queue: nil, using: { })
]
```

## Triggering Examples

```swift
↓nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil) { }
```

```swift
_ = ↓nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil) { }
```

```swift
↓nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil, using: { })
```

```swift
@discardableResult func foo() -> Any {
   return ↓nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil, using: { })
}
```