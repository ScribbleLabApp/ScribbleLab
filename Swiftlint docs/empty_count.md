# Empty Count

Prefer checking `isEmpty` over comparing `count` to zero

* **Identifier:** empty_count
* **Enabled by default:** No
* **Supports autocorrection:** No
* **Kind:** performance
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
  error
  </td>
  </tr>
  <tr>
  <td>
  only_after_dot
  </td>
  <td>
  false
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
var count = 0
```

```swift
[Int]().isEmpty
```

```swift
[Int]().count > 1
```

```swift
[Int]().count == 1
```

```swift
[Int]().count == 0xff
```

```swift
[Int]().count == 0b01
```

```swift
[Int]().count == 0o07
```

```swift
discount == 0
```

```swift
order.discount == 0
```

## Triggering Examples

```swift
[Int]().↓count == 0
```

```swift
0 == [Int]().↓count
```

```swift
[Int]().↓count==0
```

```swift
[Int]().↓count > 0
```

```swift
[Int]().↓count != 0
```

```swift
[Int]().↓count == 0x0
```

```swift
[Int]().↓count == 0x00_00
```

```swift
[Int]().↓count == 0b00
```

```swift
[Int]().↓count == 0o00
```

```swift
↓count == 0
```