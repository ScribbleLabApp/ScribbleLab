# Unavailable Condition

Use #unavailable/#available instead of #available/#unavailable with an empty body.

* **Identifier:** unavailable_condition
* **Enabled by default:** Yes
* **Supports autocorrection:** No
* **Kind:** idiomatic
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.6.0
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
if #unavailable(iOS 13) {
  loadMainWindow()
}
```

```swift
if #available(iOS 9.0, *) {
  doSomething()
} else {
  legacyDoSomething()
}
```

```swift
if #available(macOS 11.0, *) {
   // Do nothing
} else if #available(macOS 10.15, *) {
   print("do some stuff")
}
```

## Triggering Examples

```swift
if ↓#available(iOS 14.0) {

} else {
  oldIos13TrackingLogic(isEnabled: ASIdentifierManager.shared().isAdvertisingTrackingEnabled)
}
```

```swift
if ↓#available(iOS 14.0) {
  // we don't need to do anything here
} else {
  oldIos13TrackingLogic(isEnabled: ASIdentifierManager.shared().isAdvertisingTrackingEnabled)
}
```

```swift
if ↓#available(iOS 13, *) {} else {
  loadMainWindow()
}
```

```swift
if ↓#unavailable(iOS 13) {
  // Do nothing
} else if i < 2 {
  loadMainWindow()
}
```