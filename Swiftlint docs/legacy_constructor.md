# Legacy Constructor

Swift constructors are preferred over legacy convenience functions

* **Identifier:** legacy_constructor
* **Enabled by default:** Yes
* **Supports autocorrection:** Yes
* **Kind:** idiomatic
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
CGPoint(x: 10, y: 10)
```

```swift
CGPoint(x: xValue, y: yValue)
```

```swift
CGSize(width: 10, height: 10)
```

```swift
CGSize(width: aWidth, height: aHeight)
```

```swift
CGRect(x: 0, y: 0, width: 10, height: 10)
```

```swift
CGRect(x: xVal, y: yVal, width: aWidth, height: aHeight)
```

```swift
CGVector(dx: 10, dy: 10)
```

```swift
CGVector(dx: deltaX, dy: deltaY)
```

```swift
NSPoint(x: 10, y: 10)
```

```swift
NSPoint(x: xValue, y: yValue)
```

```swift
NSSize(width: 10, height: 10)
```

```swift
NSSize(width: aWidth, height: aHeight)
```

```swift
NSRect(x: 0, y: 0, width: 10, height: 10)
```

```swift
NSRect(x: xVal, y: yVal, width: aWidth, height: aHeight)
```

```swift
NSRange(location: 10, length: 1)
```

```swift
NSRange(location: loc, length: len)
```

```swift
UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 10)
```

```swift
UIEdgeInsets(top: aTop, left: aLeft, bottom: aBottom, right: aRight)
```

```swift
NSEdgeInsets(top: 0, left: 0, bottom: 10, right: 10)
```

```swift
NSEdgeInsets(top: aTop, left: aLeft, bottom: aBottom, right: aRight)
```

```swift
UIOffset(horizontal: 0, vertical: 10)
```

```swift
UIOffset(horizontal: horizontal, vertical: vertical)
```

## Triggering Examples

```swift
↓CGPointMake(10, 10)
```

```swift
↓CGPointMake(xVal, yVal)
```

```swift
↓CGPointMake(calculateX(), 10)
```

```swift
↓CGSizeMake(10, 10)
```

```swift
↓CGSizeMake(aWidth, aHeight)
```

```swift
↓CGRectMake(0, 0, 10, 10)
```

```swift
↓CGRectMake(xVal, yVal, width, height)
```

```swift
↓CGVectorMake(10, 10)
```

```swift
↓CGVectorMake(deltaX, deltaY)
```

```swift
↓NSMakePoint(10, 10)
```

```swift
↓NSMakePoint(xVal, yVal)
```

```swift
↓NSMakeSize(10, 10)
```

```swift
↓NSMakeSize(aWidth, aHeight)
```

```swift
↓NSMakeRect(0, 0, 10, 10)
```

```swift
↓NSMakeRect(xVal, yVal, width, height)
```

```swift
↓NSMakeRange(10, 1)
```

```swift
↓NSMakeRange(loc, len)
```

```swift
↓UIEdgeInsetsMake(0, 0, 10, 10)
```

```swift
↓UIEdgeInsetsMake(top, left, bottom, right)
```

```swift
↓NSEdgeInsetsMake(0, 0, 10, 10)
```

```swift
↓NSEdgeInsetsMake(top, left, bottom, right)
```

```swift
↓CGVectorMake(10, 10)
↓NSMakeRange(10, 1)
```

```swift
↓UIOffsetMake(0, 10)
```

```swift
↓UIOffsetMake(horizontal, vertical)
```