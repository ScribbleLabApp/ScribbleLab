# Type Body Length

Type bodies should not span too many lines

* **Identifier:** type_body_length
* **Enabled by default:** Yes
* **Supports autocorrection:** No
* **Kind:** metrics
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
  warning
  </td>
  <td>
  250
  </td>
  </tr>
  <tr>
  <td>
  error
  </td>
  <td>
  350
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
class Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
}

```

```swift
class Abc {



























































































































































































































































}

```

```swift
class Abc {
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
}

```

```swift
class Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0

/* this is
a multiline comment
*/}

```

```swift
struct Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
}

```

```swift
struct Abc {



























































































































































































































































}

```

```swift
struct Abc {
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
}

```

```swift
struct Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0

/* this is
a multiline comment
*/}

```

```swift
enum Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
}

```

```swift
enum Abc {



























































































































































































































































}

```

```swift
enum Abc {
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
}

```

```swift
enum Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0

/* this is
a multiline comment
*/}

```

```swift
actor Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
}

```

```swift
actor Abc {



























































































































































































































































}

```

```swift
actor Abc {
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
}

```

```swift
actor Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0

/* this is
a multiline comment
*/}

```

## Triggering Examples

```swift
↓class Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
}

```

```swift
↓struct Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
}

```

```swift
↓enum Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
}

```

```swift
↓actor Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
}

```