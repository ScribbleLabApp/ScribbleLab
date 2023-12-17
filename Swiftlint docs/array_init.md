# Array Init

Prefer using `Array(seq)` over `seq.map { $0 }` to convert a sequence into an Array

* **Identifier:** array_init
* **Enabled by default:** No
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
Array(foo)
```

```swift
foo.map { $0.0 }
```

```swift
foo.map { $1 }
```

```swift
foo.map { $0() }
```

```swift
foo.map { ((), $0) }
```

```swift
foo.map { $0! }
```

```swift
foo.map { $0! /* force unwrap */ }
```

```swift
foo.something { RouteMapper.map($0) }
```

```swift
foo.map { !$0 }
```

```swift
foo.map { /* a comment */ !$0 }
```

## Triggering Examples

```swift
foo.↓map({ $0 })
```

```swift
foo.↓map { $0 }
```

```swift
foo.↓map { return $0 }
```

```swift
    foo.↓map { elem in
        elem
    }
```

```swift
    foo.↓map { elem in
        return elem
    }
```

```swift
    foo.↓map { (elem: String) in
        elem
    }
```

```swift
    foo.↓map { elem -> String in
        elem
    }
```

```swift
foo.↓map { $0 /* a comment */ }
```

```swift
foo.↓map { /* a comment */ $0 }
```