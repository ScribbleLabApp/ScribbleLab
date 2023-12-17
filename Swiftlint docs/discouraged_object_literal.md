# Discouraged Object Literal

Prefer initializers over object literals

* **Identifier:** discouraged_object_literal
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
  image_literal
  </td>
  <td>
  true
  </td>
  </tr>
  <tr>
  <td>
  color_literal
  </td>
  <td>
  true
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
let image = UIImage(named: aVariable)
```

```swift
let image = UIImage(named: "interpolated \(variable)")
```

```swift
let color = UIColor(red: value, green: value, blue: value, alpha: 1)
```

```swift
let image = NSImage(named: aVariable)
```

```swift
let image = NSImage(named: "interpolated \(variable)")
```

```swift
let color = NSColor(red: value, green: value, blue: value, alpha: 1)
```

## Triggering Examples

```swift
let image = ↓#imageLiteral(resourceName: "image.jpg")
```

```swift
let color = ↓#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
```