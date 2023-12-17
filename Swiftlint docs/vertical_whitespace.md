# Vertical Whitespace

Limit vertical whitespace to a single empty line.

* **Identifier:** vertical_whitespace
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
  max_empty_lines
  </td>
  <td>
  1
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
let abc = 0

```

```swift
let abc = 0


```

```swift
/* bcs 



*/
```

```swift
// bca 


```

## Triggering Examples

```swift
let aaaa = 0



```

```swift
struct AAAA {}




```

```swift
class BBBB {}



```