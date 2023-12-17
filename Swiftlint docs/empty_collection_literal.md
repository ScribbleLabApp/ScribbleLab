# Empty Collection Literal

Prefer checking `isEmpty` over comparing collection to an empty array or dictionary literal

* **Identifier:** empty_collection_literal
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
  warning
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
myArray = []
```

```swift
myArray.isEmpty
```

```swift
!myArray.isEmpty
```

```swift
myDict = [:]
```

## Triggering Examples

```swift
myArray↓ == []
```

```swift
myArray↓ != []
```

```swift
myArray↓ == [ ]
```

```swift
myDict↓ == [:]
```

```swift
myDict↓ != [:]
```

```swift
myDict↓ == [: ]
```

```swift
myDict↓ == [ :]
```

```swift
myDict↓ == [ : ]
```