# Self Binding

Re-bind `self` to a consistent identifier name.

* **Identifier:** self_binding
* **Enabled by default:** No
* **Supports autocorrection:** Yes
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
  bind_identifier
  </td>
  <td>
  &quot;self&quot;
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
if let self = self { return }
```

```swift
guard let self = self else { return }
```

```swift
if let this = this { return }
```

```swift
guard let this = this else { return }
```

```swift
if let this = self { return }
```

```swift
guard let this = self else { return }
```

## Triggering Examples

```swift
if let ↓`self` = self { return }
```

```swift
guard let ↓`self` = self else { return }
```

```swift
if let ↓this = self { return }
```

```swift
guard let ↓this = self else { return }
```

```swift
if let ↓self = self { return }
```

```swift
guard let ↓self = self else { return }
```

```swift
if let ↓self { return }
```

```swift
guard let ↓self else { return }
```