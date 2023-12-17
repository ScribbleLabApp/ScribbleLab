# Returning Whitespace

Return arrow and return type should be separated by a single space or on a separate line

* **Identifier:** return_arrow_whitespace
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
func abc() -> Int {}
```

```swift
func abc() -> [Int] {}
```

```swift
func abc() -> (Int, Int) {}
```

```swift
var abc = {(param: Int) -> Void in }
```

```swift
func abc() ->
    Int {}
```

```swift
func abc()
    -> Int {}
```

```swift
func reallyLongFunctionMethods<T>(withParam1: Int, param2: String, param3: Bool) where T: AGenericConstraint
    -> Int {
    return 1
}
```

```swift
typealias SuccessBlock = ((Data) -> Void)
```

## Triggering Examples

```swift
func abc()↓->Int {}
```

```swift
func abc()↓->[Int] {}
```

```swift
func abc()↓->(Int, Int) {}
```

```swift
func abc()↓-> Int {}
```

```swift
func abc()↓->   Int {}
```

```swift
func abc()↓ ->Int {}
```

```swift
func abc()↓  ->  Int {}
```

```swift
var abc = {(param: Int)↓ ->Bool in }
```

```swift
var abc = {(param: Int)↓->Bool in }
```

```swift
typealias SuccessBlock = ((Data)↓->Void)
```

```swift
func abc()
  ↓->  Int {}
```

```swift
func abc()
 ↓->  Int {}
```

```swift
func abc()↓  ->
  Int {}
```

```swift
func abc()↓  ->
Int {}
```