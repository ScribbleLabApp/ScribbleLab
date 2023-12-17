# Vertical Parameter Alignment on Call

Function parameters should be aligned vertically if they're in multiple lines in a method call

* **Identifier:** vertical_parameter_alignment_on_call
* **Enabled by default:** No
* **Supports autocorrection:** No
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
foo(param1: 1, param2: bar
    param3: false, param4: true)
```

```swift
foo(param1: 1, param2: bar)
```

```swift
foo(param1: 1, param2: bar
    param3: false,
    param4: true)
```

```swift
foo(
   param1: 1
) { _ in }
```

```swift
UIView.animate(withDuration: 0.4, animations: {
    blurredImageView.alpha = 1
}, completion: { _ in
    self.hideLoading()
})
```

```swift
UIView.animate(withDuration: 0.4, animations: {
    blurredImageView.alpha = 1
},
completion: { _ in
    self.hideLoading()
})
```

```swift
foo(param1: 1, param2: { _ in },
    param3: false, param4: true)
```

```swift
foo({ _ in
       bar()
   },
   completion: { _ in
       baz()
   }
)
```

```swift
foo(param1: 1, param2: [
   0,
   1
], param3: 0)
```

```swift
myFunc(foo: 0,
       bar: baz == 0)
```

## Triggering Examples

```swift
foo(param1: 1, param2: bar
                ↓param3: false, param4: true)
```

```swift
foo(param1: 1, param2: bar
 ↓param3: false, param4: true)
```

```swift
foo(param1: 1, param2: bar
       ↓param3: false,
       ↓param4: true)
```

```swift
foo(param1: 1,
       ↓param2: { _ in })
```

```swift
foo(param1: 1,
    param2: { _ in
}, param3: 2,
 ↓param4: 0)
```

```swift
foo(param1: 1, param2: { _ in },
       ↓param3: false, param4: true)
```

```swift
myFunc(foo: 0,
        ↓bar: baz == 0)
```