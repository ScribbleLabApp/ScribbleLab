# Redundant Discardable Let

Prefer `_ = foo()` over `let _ = foo()` when discarding a result from a function

* **Identifier:** redundant_discardable_let
* **Enabled by default:** Yes
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
  </tbody>
  </table>

## Non Triggering Examples

```swift
_ = foo()
```

```swift
if let _ = foo() { }
```

```swift
guard let _ = foo() else { return }
```

```swift
let _: ExplicitType = foo()
```

```swift
while let _ = SplashStyle(rawValue: maxValue) { maxValue += 1 }
```

```swift
async let _ = await foo()
```

## Triggering Examples

```swift
↓let _ = foo()
```

```swift
if _ = foo() { ↓let _ = bar() }
```