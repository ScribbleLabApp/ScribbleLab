# Empty String

Prefer checking `isEmpty` over comparing `string` to an empty string literal

* **Identifier:** empty_string
* **Enabled by default:** No
* **Supports autocorrection:** No
* **Kind:** performance
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
myString.isEmpty
```

```swift
!myString.isEmpty
```

```swift
"""
foo==
"""
```

## Triggering Examples

```swift
myString↓ == ""
```

```swift
myString↓ != ""
```

```swift
myString↓==""
```

```swift
myString↓ == #""#
```

```swift
myString↓ == ##""##
```