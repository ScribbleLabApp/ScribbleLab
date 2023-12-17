# Comment Spacing

Prefer at least one space after slashes for comments

* **Identifier:** comment_spacing
* **Enabled by default:** Yes
* **Supports autocorrection:** Yes
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
// This is a comment
```

```swift
/// Triple slash comment
```

```swift
// Multiline double-slash
// comment
```

```swift
/// Multiline triple-slash
/// comment
```

```swift
/// Multiline triple-slash
///   - This is indented
```

```swift
// - MARK: Mark comment
```

```swift
//: Swift Playground prose section
```

```swift
///////////////////////////////////////////////
// Comment with some lines of slashes boxing it
///////////////////////////////////////////////
```

```swift
//:#localized(key: "SwiftPlaygroundLocalizedProse")
```

```swift
/* Asterisk comment */
```

```swift
/*
    Multiline asterisk comment
*/
```

```swift
/*:
    Multiline Swift Playground prose section
*/
```

```swift
/*#-editable-code Swift Platground editable area*/default/*#-end-editable-code*/
```

## Triggering Examples

```swift
//↓Something
```

```swift
//↓MARK
```

```swift
//↓👨‍👨‍👦‍👦Something
```

```swift
func a() {
    //↓This needs refactoring
    print("Something")
}
//↓We should improve above function
```

```swift
///↓This is a comment
```

```swift
/// Multiline triple-slash
///↓This line is incorrect, though
```

```swift
//↓- MARK: Mark comment
```

```swift
//:↓Swift Playground prose section
```