# Empty Parentheses with Trailing Closure

When using trailing closures, empty parentheses should be avoided after the method call

* **Identifier:** empty_parentheses_with_trailing_closure
* **Enabled by default:** Yes
* **Supports autocorrection:** Yes
* **Kind:** style
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
[1, 2].map { $0 + 1 }
```

```swift
[1, 2].map({ $0 + 1 })
```

```swift
[1, 2].reduce(0) { $0 + $1 }
```

```swift
[1, 2].map { number in
 number + 1 
}
```

```swift
let isEmpty = [1, 2].isEmpty()
```

```swift
UIView.animateWithDuration(0.3, animations: {
   self.disableInteractionRightView.alpha = 0
}, completion: { _ in
   ()
})
```

## Triggering Examples

```swift
[1, 2].map↓() { $0 + 1 }
```

```swift
[1, 2].map↓( ) { $0 + 1 }
```

```swift
[1, 2].map↓() { number in
 number + 1 
}
```

```swift
[1, 2].map↓(  ) { number in
 number + 1 
}
```

```swift
func foo() -> [Int] {
    return [1, 2].map↓() { $0 + 1 }
}
```