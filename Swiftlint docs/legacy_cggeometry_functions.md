# Legacy CGGeometry Functions

Struct extension properties and methods are preferred over legacy functions

* **Identifier:** legacy_cggeometry_functions
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
rect.width
```

```swift
rect.height
```

```swift
rect.minX
```

```swift
rect.midX
```

```swift
rect.maxX
```

```swift
rect.minY
```

```swift
rect.midY
```

```swift
rect.maxY
```

```swift
rect.isNull
```

```swift
rect.isEmpty
```

```swift
rect.isInfinite
```

```swift
rect.standardized
```

```swift
rect.integral
```

```swift
rect.insetBy(dx: 5.0, dy: -7.0)
```

```swift
rect.offsetBy(dx: 5.0, dy: -7.0)
```

```swift
rect1.union(rect2)
```

```swift
rect1.intersect(rect2)
```

```swift
rect1.contains(rect2)
```

```swift
rect.contains(point)
```

```swift
rect1.intersects(rect2)
```

## Triggering Examples

```swift
↓CGRectGetWidth(rect)
```

```swift
↓CGRectGetHeight(rect)
```

```swift
↓CGRectGetMinX(rect)
```

```swift
↓CGRectGetMidX(rect)
```

```swift
↓CGRectGetMaxX(rect)
```

```swift
↓CGRectGetMinY(rect)
```

```swift
↓CGRectGetMidY(rect)
```

```swift
↓CGRectGetMaxY(rect)
```

```swift
↓CGRectIsNull(rect)
```

```swift
↓CGRectIsEmpty(rect)
```

```swift
↓CGRectIsInfinite(rect)
```

```swift
↓CGRectStandardize(rect)
```

```swift
↓CGRectIntegral(rect)
```

```swift
↓CGRectInset(rect, 10, 5)
```

```swift
↓CGRectOffset(rect, -2, 8.3)
```

```swift
↓CGRectUnion(rect1, rect2)
```

```swift
↓CGRectIntersection(rect1, rect2)
```

```swift
↓CGRectContainsRect(rect1, rect2)
```

```swift
↓CGRectContainsPoint(rect, point)
```

```swift
↓CGRectIntersectsRect(rect1, rect2)
```