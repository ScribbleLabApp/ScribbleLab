# Function Parameter Count

Number of function parameters should be low.

* **Identifier:** function_parameter_count
* **Enabled by default:** Yes
* **Supports autocorrection:** No
* **Kind:** metrics
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
  warning
  </td>
  <td>
  5
  </td>
  </tr>
  <tr>
  <td>
  error
  </td>
  <td>
  8
  </td>
  </tr>
  <tr>
  <td>
  ignores_default_parameters
  </td>
  <td>
  true
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
init(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}
```

```swift
init (a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}
```

```swift
`init`(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}
```

```swift
init?(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}
```

```swift
init?<T>(a: T, b: Int, c: Int, d: Int, e: Int, f: Int) {}
```

```swift
init?<T: String>(a: T, b: Int, c: Int, d: Int, e: Int, f: Int) {}
```

```swift
func f2(p1: Int, p2: Int) { }
```

```swift
func f(a: Int, b: Int, c: Int, d: Int, x: Int = 42) {}
```

```swift
func f(a: [Int], b: Int, c: Int, d: Int, f: Int) -> [Int] {
    let s = a.flatMap { $0 as? [String: Int] } ?? []}}
```

```swift
override func f(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}
```

## Triggering Examples

```swift
↓func f(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}
```

```swift
↓func initialValue(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}
```

```swift
private ↓func f(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int = 2, g: Int) {}
```

```swift
struct Foo {
    init(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}
    ↓func bar(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}}
```