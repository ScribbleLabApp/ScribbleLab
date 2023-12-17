# Inclusive Language

Identifiers should use inclusive language that avoids discrimination against groups of people based on race, gender, or socioeconomic status.

* **Identifier:** inclusive_language
* **Enabled by default:** Yes
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
let foo = "abc"
```

```swift
enum AllowList {
    case foo, bar
}
```

```swift
func updateAllowList(add: String) {}
```

```swift
enum WalletItemType {
    case visa
    case mastercard
}
```

```swift
func chargeMasterCard(_ card: Card) {}
```

## Triggering Examples

```swift
let ↓slave = "abc"
```

```swift
enum ↓BlackList {
    case foo, bar
}
```

```swift
func ↓updateWhiteList(add: String) {}
```

```swift
enum ListType {
    case ↓whitelist
    case ↓blacklist
}
```

```swift
init(↓master: String, ↓slave: String) {}
```

```swift
final class FooBar {
    func register<↓Master, ↓Slave>(one: Master, two: Slave) {}
}
```