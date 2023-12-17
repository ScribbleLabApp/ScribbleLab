# Duplicate Conditions

Duplicate sets of conditions in the same branch instruction should be avoided

* **Identifier:** duplicate_conditions
* **Enabled by default:** Yes
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
  error
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
    if x < 5 {
      foo()
    } else if y == "s" {
      bar()
    }
```

```swift
    if x < 5 {
      foo()
    }
    if x < 5 {
      bar()
    }
```

```swift
    if x < 5, y == "s" {
      foo()
    } else if x < 5 {
      bar()
    }
```

```swift
    switch x {
    case "a":
      foo()
      bar()
    }
```

```swift
    switch x {
    case "a" where y == "s":
      foo()
    case "a" where y == "t":
      bar()
    }
```

```swift
    if let x = maybeAbc {
      foo()
    } else if let x = maybePqr {
      bar()
    }
```

```swift
    if let x = maybeAbc, let z = x.maybeY {
      foo()
    } else if let x = maybePqr, let z = x.maybeY {
      bar()
    }
```

```swift
    if case .p = x {
      foo()
    } else if case .q = x {
      bar()
    }
```

```swift
    if true {
      if true { foo() }
    }
```

## Triggering Examples

```swift
    if ↓x < 5 {
      foo()
    } else if y == "s" {
      bar()
    } else if ↓x < 5 {
      baz()
    }
```

```swift
    if z {
      if ↓x < 5 {
        foo()
      } else if y == "s" {
        bar()
      } else if ↓x < 5 {
        baz()
      }
    }
```

```swift
    if ↓x < 5, y == "s" {
      foo()
    } else if x < 10 {
      bar()
    } else if ↓y == "s", x < 5 {
      baz()
    }
```

```swift
    switch x {
    case ↓"a", "b":
      foo()
    case "c", ↓"a":
      bar()
    }
```

```swift
    switch x {
    case ↓"a" where y == "s":
      foo()
    case ↓"a" where y == "s":
      bar()
    }
```

```swift
    if ↓let xyz = maybeXyz {
      foo()
    } else if ↓let xyz = maybeXyz {
      bar()
    }
```

```swift
    if ↓let x = maybeAbc, let z = x.maybeY {
      foo()
    } else if ↓let x = maybeAbc, let z = x.maybeY {
      bar()
    }
```

```swift
    if ↓#available(macOS 10.15, *) {
      foo()
    } else if ↓#available(macOS 10.15, *) {
      bar()
    }
```

```swift
    if ↓case .p = x {
      foo()
    } else if ↓case .p = x {
      bar()
    }
```

```swift
    if ↓x < 5 {}
    else if ↓x < 5 {}
    else if ↓x < 5 {}
```