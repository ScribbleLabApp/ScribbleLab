# Legacy NSGeometry Functions

Struct extension properties and methods are preferred over legacy functions

* **Identifier:** legacy_nsgeometry_functions
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
rect.isEmpty
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
rect1.intersection(rect2)
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
↓NSWidth(rect)
```

```swift
↓NSHeight(rect)
```

```swift
↓NSMinX(rect)
```

```swift
↓NSMidX(rect)
```

```swift
↓NSMaxX(rect)
```

```swift
↓NSMinY(rect)
```

```swift
↓NSMidY(rect)
```

```swift
↓NSMaxY(rect)
```

```swift
↓NSEqualRects(rect1, rect2)
```

```swift
↓NSEqualSizes(size1, size2)
```

```swift
↓NSEqualPoints(point1, point2)
```

```swift
↓NSEdgeInsetsEqual(insets2, insets2)
```

```swift
↓NSIsEmptyRect(rect)
```

```swift
↓NSIntegralRect(rect)
```

```swift
↓NSInsetRect(rect, 10, 5)
```

```swift
↓NSOffsetRect(rect, -2, 8.3)
```

```swift
↓NSUnionRect(rect1, rect2)
```

```swift
↓NSIntersectionRect(rect1, rect2)
```

```swift
↓NSContainsRect(rect1, rect2)
```

```swift
↓NSPointInRect(rect, point)
```

```swift
↓NSIntersectsRect(rect1, rect2)
```