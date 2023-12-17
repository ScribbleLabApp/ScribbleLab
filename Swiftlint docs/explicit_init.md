# Explicit Init

Explicitly calling .init() should be avoided

* **Identifier:** explicit_init
* **Enabled by default:** No
* **Supports autocorrection:** Yes
* **Kind:** idiomatic
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
  include_bare_init
  </td>
  <td>
  false
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
import Foundation
class C: NSObject {
    override init() {
        super.init()
    }
}
```

```swift
struct S {
    let n: Int
}
extension S {
    init() {
        self.init(n: 1)
    }
}
```

```swift
[1].flatMap(String.init)
```

```swift
[String.self].map { $0.init(1) }
```

```swift
[String.self].map { type in type.init(1) }
```

```swift
Observable.zip(obs1, obs2, resultSelector: MyType.init).asMaybe()
```

```swift
_ = GleanMetrics.Tabs.someType.init()
```

```swift
Observable.zip(
  obs1,
  obs2,
  resultSelector: MyType.init
).asMaybe()
```

## Triggering Examples

```swift
[1].flatMap{String↓.init($0)}
```

```swift
[String.self].map { Type in Type↓.init(1) }
```

```swift
func foo() -> [String] {
    return [1].flatMap { String↓.init($0) }
}
```

```swift
_ = GleanMetrics.Tabs.GroupedTabExtra↓.init()
```

```swift
_ = Set<KsApi.Category>↓.init()
```

```swift
Observable.zip(
  obs1,
  obs2,
  resultSelector: { MyType↓.init($0, $1) }
).asMaybe()
```