# Prefer For-Where

`where` clauses are preferred over a single `if` inside a `for`

* **Identifier:** for_where
* **Enabled by default:** Yes
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
  <tr>
  <td>
  allow_for_as_filter
  </td>
  <td>
  false
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
for user in users where user.id == 1 { }
```

```swift
for user in users {
  if let id = user.id { }
}
```

```swift
for user in users {
  if var id = user.id { }
}
```

```swift
for user in users {
  if user.id == 1 { } else { }
}
```

```swift
for user in users {
  if user.id == 1 {
  } else if user.id == 2 { }
}
```

```swift
for user in users {
  if user.id == 1 { }
  print(user)
}
```

```swift
for user in users {
  let id = user.id
  if id == 1 { }
}
```

```swift
for user in users {
  if user.id == 1 { }
  return true
}
```

```swift
for user in users {
  if user.id == 1 && user.age > 18 { }
}
```

```swift
for user in users {
  if user.id == 1, user.age > 18 { }
}
```

```swift
for (index, value) in array.enumerated() {
  if case .valueB(_) = value {
    return index
  }
}
```

```swift
for user in users {
  if user.id == 1 { return true }
}
```

```swift
for user in users {
  if user.id == 1 {
    let derivedValue = calculateValue(from: user)
    return derivedValue != 0
  }
}
```

## Triggering Examples

```swift
for user in users {
  ↓if user.id == 1 { return true }
}
```

```swift
for subview in subviews {
    ↓if !(subview is UIStackView) {
        subview.removeConstraints(subview.constraints)
        subview.removeFromSuperview()
    }
}
```

```swift
for subview in subviews {
    ↓if !(subview is UIStackView) {
        subview.removeConstraints(subview.constraints)
        subview.removeFromSuperview()
    }
}
```