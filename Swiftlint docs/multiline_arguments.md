# Multiline Arguments

Arguments should be either on the same line, or one per line

* **Identifier:** multiline_arguments
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
  <tr>
  <td>
  first_argument_location
  </td>
  <td>
  any_line
  </td>
  </tr>
  <tr>
  <td>
  only_enforce_after_first_closure_on_first_line
  </td>
  <td>
  false
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
foo()
```

```swift
foo(
)
```

```swift
foo { }
```

```swift
foo {

}
```

```swift
foo(0)
```

```swift
foo(0, 1)
```

```swift
foo(0, 1) { }
```

```swift
foo(0, param1: 1)
```

```swift
foo(0, param1: 1) { }
```

```swift
foo(param1: 1)
```

```swift
foo(param1: 1) { }
```

```swift
foo(param1: 1, param2: true) { }
```

```swift
foo(param1: 1, param2: true, param3: [3]) { }
```

```swift
foo(param1: 1, param2: true, param3: [3]) {
    bar()
}
```

```swift
foo(param1: 1,
    param2: true,
    param3: [3])
```

```swift
foo(
    param1: 1, param2: true, param3: [3]
)
```

```swift
foo(
    param1: 1,
    param2: true,
    param3: [3]
)
```

```swift
Picker(selection: viewStore.binding(\.$someProperty)) {
   ForEach(SomeEnum.allCases, id: \.rawValue) { someCase in
      Text(someCase.rawValue)
         .tag(someCase)
   }
} label: {
   EmptyView()
}
```

```swift
UIView.animate(withDuration: 1,
               delay: 0) {
    // sample
    print("a")
} completion: { _ in
    // sample
    print("b")
}
```

```swift
UIView.animate(withDuration: 1, delay: 0) {
    print("a")
} completion: { _ in
    print("b")
}
```

## Triggering Examples

```swift
foo(0,
    param1: 1, ↓param2: true, ↓param3: [3])
```

```swift
foo(0, ↓param1: 1,
    param2: true, ↓param3: [3])
```

```swift
foo(0, ↓param1: 1, ↓param2: true,
    param3: [3])
```

```swift
foo(
    0, ↓param1: 1,
    param2: true, ↓param3: [3]
)
```