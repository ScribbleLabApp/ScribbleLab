# Required Deinit

Classes should have an explicit deinit method

* **Identifier:** required_deinit
* **Enabled by default:** No
* **Supports autocorrection:** No
* **Kind:** lint
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
class Apple {
    deinit { }
}
```

```swift
enum Banana { }
```

```swift
protocol Cherry { }
```

```swift
struct Damson { }
```

```swift
class Outer {
    deinit { print("Deinit Outer") }
    class Inner {
        deinit { print("Deinit Inner") }
    }
}
```

## Triggering Examples

```swift
↓class Apple { }
```

```swift
↓class Banana: NSObject, Equatable { }
```

```swift
↓class Cherry {
    // deinit { }
}
```

```swift
↓class Damson {
    func deinitialize() { }
}
```

```swift
class Outer {
    func hello() -> String { return "outer" }
    deinit { }
    ↓class Inner {
        func hello() -> String { return "inner" }
    }
}
```

```swift
↓class Outer {
    func hello() -> String { return "outer" }
    class Inner {
        func hello() -> String { return "inner" }
        deinit { }
    }
}
```