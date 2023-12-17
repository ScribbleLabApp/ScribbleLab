# Discouraged Direct Initialization

Discouraged direct initialization of types that can be harmful

* **Identifier:** discouraged_direct_init
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
  <tr>
  <td>
  types
  </td>
  <td>
  [&quot;Bundle&quot;, &quot;Bundle.init&quot;, &quot;NSError&quot;, &quot;NSError.init&quot;, &quot;UIDevice&quot;, &quot;UIDevice.init&quot;]
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
let foo = UIDevice.current
```

```swift
let foo = Bundle.main
```

```swift
let foo = Bundle(path: "bar")
```

```swift
let foo = Bundle(identifier: "bar")
```

```swift
let foo = Bundle.init(path: "bar")
```

```swift
let foo = Bundle.init(identifier: "bar")
```

```swift
let foo = NSError(domain: "bar", code: 0)
```

```swift
let foo = NSError.init(domain: "bar", code: 0)
```

```swift
func testNSError()
```

## Triggering Examples

```swift
↓UIDevice()
```

```swift
↓Bundle()
```

```swift
let foo = ↓UIDevice()
```

```swift
let foo = ↓Bundle()
```

```swift
let foo = ↓NSError()
```

```swift
let foo = bar(bundle: ↓Bundle(), device: ↓UIDevice(), error: ↓NSError())
```

```swift
↓UIDevice.init()
```

```swift
↓Bundle.init()
```

```swift
↓NSError.init()
```

```swift
let foo = ↓UIDevice.init()
```

```swift
let foo = ↓Bundle.init()
```

```swift
let foo = bar(bundle: ↓Bundle.init(), device: ↓UIDevice.init(), error: ↓NSError.init())
```