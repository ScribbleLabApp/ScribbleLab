# Notification Center Detachment

An object should only remove itself as an observer in `deinit`

* **Identifier:** notification_center_detachment
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
class Foo {
   deinit {
       NotificationCenter.default.removeObserver(self)
   }
}
```

```swift
class Foo {
   func bar() {
       NotificationCenter.default.removeObserver(otherObject)
   }
}
```

## Triggering Examples

```swift
class Foo {
   func bar() {
       ↓NotificationCenter.default.removeObserver(self)
   }
}
```