# Object Literal

Prefer object literals over image and color inits

* **Identifier:** object_literal
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
let image = #imageLiteral(resourceName: "image.jpg")
```

```swift
let color = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
```

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
let image = ↓UIImage(named: "foo")
```

```swift
let color = ↓UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1)
```

```swift
let color = ↓UIColor(red: 100 / 255.0, green: 50 / 255.0, blue: 0, alpha: 1)
```

```swift
let color = ↓UIColor(white: 0.5, alpha: 1)
```

```swift
let image = ↓NSImage(named: "foo")
```

```swift
let color = ↓NSColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1)
```

```swift
let color = ↓NSColor(red: 100 / 255.0, green: 50 / 255.0, blue: 0, alpha: 1)
```

```swift
let color = ↓NSColor(white: 0.5, alpha: 1)
```

```swift
let image = ↓UIImage.init(named: "foo")
```

```swift
let color = ↓UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1)
```

```swift
let color = ↓UIColor.init(red: 100 / 255.0, green: 50 / 255.0, blue: 0, alpha: 1)
```

```swift
let color = ↓UIColor.init(white: 0.5, alpha: 1)
```

```swift
let image = ↓NSImage.init(named: "foo")
```

```swift
let color = ↓NSColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1)
```

```swift
let color = ↓NSColor.init(red: 100 / 255.0, green: 50 / 255.0, blue: 0, alpha: 1)
```

```swift
let color = ↓NSColor.init(white: 0.5, alpha: 1)
```