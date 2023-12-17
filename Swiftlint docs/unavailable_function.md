# Unavailable Function

Unimplemented functions should be marked as unavailable

* **Identifier:** unavailable_function
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
class ViewController: UIViewController {
  @available(*, unavailable)
  public required init?(coder aDecoder: NSCoder) {
    preconditionFailure("init(coder:) has not been implemented")
  }
}
```

```swift
func jsonValue(_ jsonString: String) -> NSObject {
   let data = jsonString.data(using: .utf8)!
   let result = try! JSONSerialization.jsonObject(with: data, options: [])
   if let dict = (result as? [String: Any])?.bridge() {
    return dict
   } else if let array = (result as? [Any])?.bridge() {
    return array
   }
   fatalError()
}
```

```swift
func resetOnboardingStateAndCrash() -> Never {
    resetUserDefaults()
    // Crash the app to re-start the onboarding flow.
    fatalError("Onboarding re-start crash.")
}
```

## Triggering Examples

```swift
class ViewController: UIViewController {
  public required ↓init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
```

```swift
class ViewController: UIViewController {
  public required ↓init?(coder aDecoder: NSCoder) {
    let reason = "init(coder:) has not been implemented"
    fatalError(reason)
  }
}
```

```swift
class ViewController: UIViewController {
  public required ↓init?(coder aDecoder: NSCoder) {
    preconditionFailure("init(coder:) has not been implemented")
  }
}
```

```swift
↓func resetOnboardingStateAndCrash() {
    resetUserDefaults()
    // Crash the app to re-start the onboarding flow.
    fatalError("Onboarding re-start crash.")
}
```