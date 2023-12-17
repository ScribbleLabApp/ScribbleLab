# Multiline Function Chains

Chained function calls should be either on the same line, or one per line

* **Identifier:** multiline_function_chains
* **Enabled by default:** No
* **Supports autocorrection:** No
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
let evenSquaresSum = [20, 17, 35, 4].filter { $0 % 2 == 0 }.map { $0 * $0 }.reduce(0, +)
```

```swift
let evenSquaresSum = [20, 17, 35, 4]
    .filter { $0 % 2 == 0 }.map { $0 * $0 }.reduce(0, +)",
```

```swift
let chain = a
    .b(1, 2, 3)
    .c { blah in
        print(blah)
    }
    .d()
```

```swift
let chain = a.b(1, 2, 3)
    .c { blah in
        print(blah)
    }
    .d()
```

```swift
let chain = a.b(1, 2, 3)
    .c { blah in print(blah) }
    .d()
```

```swift
let chain = a.b(1, 2, 3)
    .c(.init(
        a: 1,
        b, 2,
        c, 3))
    .d()
```

```swift
self.viewModel.outputs.postContextualNotification
  .observeForUI()
  .observeValues {
    NotificationCenter.default.post(
      Notification(
        name: .ksr_showNotificationsDialog,
        userInfo: [UserInfoKeys.context: PushNotificationDialog.Context.pledge,
                   UserInfoKeys.viewController: self]
     )
    )
  }
```

```swift
let remainingIDs = Array(Set(self.currentIDs).subtracting(Set(response.ids)))
```

```swift
self.happeningNewsletterOn = self.updateCurrentUser
    .map { $0.newsletters.happening }.skipNil().skipRepeats()
```

## Triggering Examples

```swift
let evenSquaresSum = [20, 17, 35, 4]
    .filter { $0 % 2 == 0 }↓.map { $0 * $0 }
    .reduce(0, +)
```

```swift
let evenSquaresSum = a.b(1, 2, 3)
    .c { blah in
        print(blah)
    }↓.d()
```

```swift
let evenSquaresSum = a.b(1, 2, 3)
    .c(2, 3, 4)↓.d()
```

```swift
let evenSquaresSum = a.b(1, 2, 3)↓.c { blah in
        print(blah)
    }
    .d()
```

```swift
a.b {
//  ““
}↓.e()
```