# Unneeded Break in Switch

Avoid using unneeded break statements

* **Identifier:** unneeded_break_in_switch
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
  </tbody>
  </table>

## Non Triggering Examples

```swift
switch foo {
case .bar:
    break
}
```

```swift
switch foo {
default:
    break
}
```

```swift
switch foo {
case .bar:
    for i in [0, 1, 2] { break }
}
```

```swift
switch foo {
case .bar:
    if true { break }
}
```

```swift
switch foo {
case .bar:
    something()
}
```

```swift
let items = [Int]()
for item in items {
    if bar() {
        do {
            try foo()
        } catch {
            bar()
            break
        }
    }
}
```

## Triggering Examples

```swift
switch foo {
case .bar:
    something()
    ↓break
}
```

```swift
switch foo {
case .bar:
    something()
    ↓break // comment
}
```

```swift
switch foo {
default:
    something()
    ↓break
}
```

```swift
switch foo {
case .foo, .foo2 where condition:
    something()
    ↓break
}
```