# Toggle Bool

Prefer `someBool.toggle()` over `someBool = !someBool`

* **Identifier:** toggle_bool
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
isHidden.toggle()
```

```swift
view.clipsToBounds.toggle()
```

```swift
func foo() { abc.toggle() }
```

```swift
view.clipsToBounds = !clipsToBounds
```

```swift
disconnected = !connected
```

```swift
result = !result.toggle()
```

## Triggering Examples

```swift
↓isHidden = !isHidden
```

```swift
↓view.clipsToBounds = !view.clipsToBounds
```

```swift
func foo() { ↓abc = !abc }
```