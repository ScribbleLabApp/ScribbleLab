# Mark

MARK comment should be in valid format. e.g. '// MARK: ...' or '// MARK: - ...'

* **Identifier:** mark
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
// MARK: good
```

```swift
// MARK: - good
```

```swift
// MARK: -
```

```swift
// BOOKMARK
```

```swift
//BOOKMARK
```

```swift
// BOOKMARKS
```

```swift
/*
func test1() {
}
//MARK: mark
func test2() {
}
*/
```

## Triggering Examples

```swift
↓//MARK: bad
```

```swift
↓// MARK:bad
```

```swift
↓//MARK:bad
```

```swift
↓//  MARK: bad
```

```swift
↓// MARK:  bad
```

```swift
↓// MARK: -bad
```

```swift
↓// MARK:- bad
```

```swift
↓// MARK:-bad
```

```swift
↓//MARK: - bad
```

```swift
↓//MARK:- bad
```

```swift
↓//MARK: -bad
```

```swift
↓//MARK:-bad
```

```swift
↓//Mark: bad
```

```swift
↓// Mark: bad
```

```swift
↓// MARK bad
```

```swift
↓//MARK bad
```

```swift
↓// MARK - bad
```

```swift
↓//MARK : bad
```

```swift
↓// MARKL:
```

```swift
↓// MARKR 
```

```swift
↓// MARKK -
```

```swift
↓/// MARK:
```

```swift
↓/// MARK bad
```

```swift
↓//MARK:- Top-Level bad mark
↓//MARK:- Another bad mark
struct MarkTest {}
↓// MARK:- Bad mark
extension MarkTest {}
```