# NSLocalizedString Key

Static strings should be used as key/comment in NSLocalizedString in order for genstrings to work

* **Identifier:** nslocalizedstring_key
* **Enabled by default:** No
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
  </tbody>
  </table>

## Non Triggering Examples

```swift
NSLocalizedString("key", comment: "")
```

```swift
NSLocalizedString("key" + "2", comment: "")
```

```swift
NSLocalizedString("key", comment: "comment")
```

```swift
NSLocalizedString("This is a multi-" +
    "line string", comment: "")
```

```swift
let format = NSLocalizedString("%@, %@.", comment: "Accessibility label for a post in the post list." +
" The parameters are the title, and date respectively." +
" For example, "Let it Go, 1 hour ago."")
```

## Triggering Examples

```swift
NSLocalizedString(↓method(), comment: "")
```

```swift
NSLocalizedString(↓"key_\(param)", comment: "")
```

```swift
NSLocalizedString("key", comment: ↓"comment with \(param)")
```

```swift
NSLocalizedString(↓"key_\(param)", comment: ↓method())
```