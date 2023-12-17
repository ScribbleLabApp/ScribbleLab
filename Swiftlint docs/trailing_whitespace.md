# Trailing Whitespace

Lines should not have trailing whitespace

* **Identifier:** trailing_whitespace
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
  <tr>
  <td>
  ignores_empty_lines
  </td>
  <td>
  false
  </td>
  </tr>
  <tr>
  <td>
  ignores_comments
  </td>
  <td>
  true
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
let name: String

```

```swift
//

```

```swift
// 

```

```swift
let name: String //

```

```swift
let name: String // 

```

## Triggering Examples

```swift
let name: String 

```

```swift
/* */ let name: String 

```