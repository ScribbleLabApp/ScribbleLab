# Legacy Multiple

Prefer using the `isMultiple(of:)` function instead of using the remainder operator (`%`)

* **Identifier:** legacy_multiple
* **Enabled by default:** No
* **Supports autocorrection:** No
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
cell.contentView.backgroundColor = indexPath.row.isMultiple(of: 2) ? .gray : .white
```

```swift
guard count.isMultiple(of: 2) else { throw DecodingError.dataCorrupted(...) }
```

```swift
sanityCheck(bytes > 0 && bytes.isMultiple(of: 4), "capacity must be multiple of 4 bytes")
```

```swift
guard let i = reversedNumbers.firstIndex(where: { $0.isMultiple(of: 2) }) else { return }
```

```swift
let constant = 56
let isMultiple = value.isMultiple(of: constant)
```

```swift
let constant = 56
let secret = value % constant == 5
```

```swift
let secretValue = (value % 3) + 2
```

## Triggering Examples

```swift
cell.contentView.backgroundColor = indexPath.row ↓% 2 == 0 ? .gray : .white
```

```swift
cell.contentView.backgroundColor = 0 == indexPath.row ↓% 2 ? .gray : .white
```

```swift
cell.contentView.backgroundColor = indexPath.row ↓% 2 != 0 ? .gray : .white
```

```swift
guard count ↓% 2 == 0 else { throw DecodingError.dataCorrupted(...) }
```

```swift
sanityCheck(bytes > 0 && bytes ↓% 4 == 0, "capacity must be multiple of 4 bytes")
```

```swift
guard let i = reversedNumbers.firstIndex(where: { $0 ↓% 2 == 0 }) else { return }
```

```swift
let constant = 56
let isMultiple = value ↓% constant == 0
```