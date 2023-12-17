# Multiline Arguments Brackets

Multiline arguments should have their surrounding brackets in a new line

* **Identifier:** multiline_arguments_brackets
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
foo(param1: "Param1", param2: "Param2", param3: "Param3")
```

```swift
foo(
    param1: "Param1", param2: "Param2", param3: "Param3"
)
```

```swift
func foo(
    param1: "Param1",
    param2: "Param2",
    param3: "Param3"
)
```

```swift
foo { param1, param2 in
    print("hello world")
}
```

```swift
foo(
    bar(
        x: 5,
        y: 7
    )
)
```

```swift
AlertViewModel.AlertAction(title: "some title", style: .default) {
    AlertManager.shared.presentNextDebugAlert()
}
```

```swift
public final class Logger {
    public static let shared = Logger(outputs: [
        OSLoggerOutput(),
        ErrorLoggerOutput()
    ])
}
```

```swift
let errors = try self.download([
    (description: description, priority: priority),
])
```

```swift
return SignalProducer({ observer, _ in
    observer.sendCompleted()
}).onMainQueue()
```

```swift
SomeType(a: [
    1, 2, 3
], b: [1, 2])
```

```swift
SomeType(
  a: 1
) { print("completion") }
```

```swift
SomeType(
  a: 1
) {
  print("completion")
}
```

```swift
SomeType(
  a: .init() { print("completion") }
)
```

```swift
SomeType(
  a: .init() {
    print("completion")
  }
)
```

```swift
SomeType(
  a: 1
) {} onError: {}
```

## Triggering Examples

```swift
foo(↓param1: "Param1", param2: "Param2",
         param3: "Param3"
)
```

```swift
foo(
    param1: "Param1",
    param2: "Param2",
    param3: "Param3"↓)
```

```swift
foo(↓param1: "Param1",
    param2: "Param2",
    param3: "Param3"↓)
```

```swift
foo(↓bar(
    x: 5,
    y: 7
)
)
```

```swift
foo(
    bar(
        x: 5,
        y: 7
)↓)
```

```swift
SomeOtherType(↓a: [
        1, 2, 3
    ],
    b: "two"↓)
```

```swift
SomeOtherType(
  a: 1↓) {}
```

```swift
SomeOtherType(
  a: 1↓) {
  print("completion")
}
```