# Multiline Parameters Brackets

Multiline parameters should have their surrounding brackets in a new line

* **Identifier:** multiline_parameters_brackets
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
func foo(param1: String, param2: String, param3: String)
```

```swift
func foo(
    param1: String, param2: String, param3: String
)
```

```swift
func foo(
    param1: String,
    param2: String,
    param3: String
)
```

```swift
class SomeType {
    func foo(param1: String, param2: String, param3: String)
}
```

```swift
class SomeType {
    func foo(
        param1: String, param2: String, param3: String
    )
}
```

```swift
class SomeType {
    func foo(
        param1: String,
        param2: String,
        param3: String
    )
}
```

```swift
func foo<T>(param1: T, param2: String, param3: String) -> T { /* some code */ }
```

```swift
    func foo(a: [Int] = [
        1
    ])
```

## Triggering Examples

```swift
func foo(↓param1: String, param2: String,
         param3: String
)
```

```swift
func foo(
    param1: String,
    param2: String,
    param3: String↓)
```

```swift
class SomeType {
    func foo(↓param1: String, param2: String,
             param3: String
    )
}
```

```swift
class SomeType {
    func foo(
        param1: String,
        param2: String,
        param3: String↓)
}
```

```swift
func foo<T>(↓param1: T, param2: String,
         param3: String
) -> T
```