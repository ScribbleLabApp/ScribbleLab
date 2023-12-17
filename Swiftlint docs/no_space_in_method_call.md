# No Space in Method Call

Don't add a space between the method name and the parentheses

* **Identifier:** no_space_in_method_call
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
foo()
```

```swift
object.foo()
```

```swift
object.foo(1)
```

```swift
object.foo(value: 1)
```

```swift
object.foo { print($0 }
```

```swift
list.sorted { $0.0 < $1.0 }.map { $0.value }
```

```swift
self.init(rgb: (Int) (colorInt))
```

```swift
Button {
    print("Button tapped")
} label: {
    Text("Button")
}
```

## Triggering Examples

```swift
foo↓ ()
```

```swift
object.foo↓ ()
```

```swift
object.foo↓ (1)
```

```swift
object.foo↓ (value: 1)
```

```swift
object.foo↓ () {}
```

```swift
object.foo↓     ()
```

```swift
object.foo↓     (value: 1) { x in print(x) }
```