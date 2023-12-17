# Orphaned Doc Comment

A doc comment should be attached to a declaration

* **Identifier:** orphaned_doc_comment
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
  </tbody>
  </table>

## Non Triggering Examples

```swift
/// My great property
var myGreatProperty: String!
```

```swift
//////////////////////////////////////
//
// Copyright header.
//
//////////////////////////////////////
```

```swift
/// Look here for more info: https://github.com.
var myGreatProperty: String!
```

```swift
/// Look here for more info:
/// https://github.com.
var myGreatProperty: String!
```

## Triggering Examples

```swift
↓/// My great property
// Not a doc string
var myGreatProperty: String!
```

```swift
↓/// Look here for more info: https://github.com.
// Not a doc string
var myGreatProperty: String!
```