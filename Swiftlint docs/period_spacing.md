# Period Spacing

Periods should not be followed by more than one space

* **Identifier:** period_spacing
* **Enabled by default:** No
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
  </tbody>
  </table>

## Non Triggering Examples

```swift
let pi = 3.2
```

```swift
let pi = Double.pi
```

```swift
let pi = Double. pi
```

```swift
let pi = Double.  pi
```

```swift
// A. Single.
```

```swift
///   - code: Identifier of the error. Integer.
```

```swift
// value: Multiline.
//        Comment.
```

```swift
/**
Sentence ended in period.

- Sentence 2 new line characters after.
**/
```

## Triggering Examples

```swift
/* Only god knows why. ↓ This symbol does nothing. */
```

```swift
// Only god knows why. ↓ This symbol does nothing.
```

```swift
// Single. Double. ↓ End.
```

```swift
// Single. Double. ↓ Triple. ↓  End.
```

```swift
// Triple. ↓  Quad. ↓   End.
```

```swift
///   - code: Identifier of the error. ↓ Integer.
```