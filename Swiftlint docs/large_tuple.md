# Large Tuple

Tuples shouldn't have too many members. Create a custom type instead.

* **Identifier:** large_tuple
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
  2
  </td>
  </tr>
  <tr>
  <td>
  error
  </td>
  <td>
  3
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
let foo: (Int, Int)
```

```swift
let foo: (start: Int, end: Int)
```

```swift
let foo: (Int, (Int, String))
```

```swift
func foo() -> (Int, Int)
```

```swift
func foo() -> (Int, Int) {}
```

```swift
func foo(bar: String) -> (Int, Int)
```

```swift
func foo(bar: String) -> (Int, Int) {}
```

```swift
func foo() throws -> (Int, Int)
```

```swift
func foo() throws -> (Int, Int) {}
```

```swift
let foo: (Int, Int, Int) -> Void
```

```swift
let foo: (Int, Int, Int) throws -> Void
```

```swift
func foo(bar: (Int, String, Float) -> Void)
```

```swift
func foo(bar: (Int, String, Float) throws -> Void)
```

```swift
var completionHandler: ((_ data: Data?, _ resp: URLResponse?, _ e: NSError?) -> Void)!
```

```swift
func getDictionaryAndInt() -> (Dictionary<Int, String>, Int)?
```

```swift
func getGenericTypeAndInt() -> (Type<Int, String, Float>, Int)?
```

```swift
func foo() async -> (Int, Int)
```

```swift
func foo() async -> (Int, Int) {}
```

```swift
func foo(bar: String) async -> (Int, Int)
```

```swift
func foo(bar: String) async -> (Int, Int) {}
```

```swift
func foo() async throws -> (Int, Int)
```

```swift
func foo() async throws -> (Int, Int) {}
```

```swift
let foo: (Int, Int, Int) async -> Void
```

```swift
let foo: (Int, Int, Int) async throws -> Void
```

```swift
func foo(bar: (Int, String, Float) async -> Void)
```

```swift
func foo(bar: (Int, String, Float) async throws -> Void)
```

```swift
func getDictionaryAndInt() async -> (Dictionary<Int, String>, Int)?
```

```swift
func getGenericTypeAndInt() async -> (Type<Int, String, Float>, Int)?
```

## Triggering Examples

```swift
let foo: ↓(Int, Int, Int)
```

```swift
let foo: ↓(start: Int, end: Int, value: String)
```

```swift
let foo: (Int, ↓(Int, Int, Int))
```

```swift
func foo(bar: ↓(Int, Int, Int))
```

```swift
func foo() -> ↓(Int, Int, Int)
```

```swift
func foo() -> ↓(Int, Int, Int) {}
```

```swift
func foo(bar: String) -> ↓(Int, Int, Int)
```

```swift
func foo(bar: String) -> ↓(Int, Int, Int) {}
```

```swift
func foo() throws -> ↓(Int, Int, Int)
```

```swift
func foo() throws -> ↓(Int, Int, Int) {}
```

```swift
func foo() throws -> ↓(Int, ↓(String, String, String), Int) {}
```

```swift
func getDictionaryAndInt() -> (Dictionary<Int, ↓(String, String, String)>, Int)?
```

```swift
func foo(bar: ↓(Int, Int, Int)) async
```

```swift
func foo() async -> ↓(Int, Int, Int)
```

```swift
func foo() async -> ↓(Int, Int, Int) {}
```

```swift
func foo(bar: String) async -> ↓(Int, Int, Int)
```

```swift
func foo(bar: String) async -> ↓(Int, Int, Int) {}
```

```swift
func foo() async throws -> ↓(Int, Int, Int)
```

```swift
func foo() async throws -> ↓(Int, Int, Int) {}
```

```swift
func foo() async throws -> ↓(Int, ↓(String, String, String), Int) {}
```

```swift
func getDictionaryAndInt() async -> (Dictionary<Int, ↓(String, String, String)>, Int)?
```