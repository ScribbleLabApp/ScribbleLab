# Strict Fileprivate

`fileprivate` should be avoided

* **Identifier:** strict_fileprivate
* **Enabled by default:** No
* **Supports autocorrection:** No
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
  </tbody>
  </table>

## Non Triggering Examples

```swift
extension String {}
```

```swift
private extension String {}
```

```swift
public
    extension String {
        var i: Int { 1 }
    }
```

```swift
    private enum E {
        func f() {}
    }
```

```swift
    public struct S {
        internal let i: Int
    }
```

```swift
    open class C {
        private func f() {}
    }
```

```swift
    internal actor A {}
```

## Triggering Examples

```swift
    ↓fileprivate class C {
        ↓fileprivate func f() {}
    }
```

```swift
    ↓fileprivate extension String {
        ↓fileprivate var isSomething: Bool { self == "something" }
    }
```

```swift
    ↓fileprivate actor A {
        ↓fileprivate let i = 1
    }
```

```swift
    ↓fileprivate struct C {
        ↓fileprivate(set) var myInt = 4
    }
```

```swift
    struct Outter {
        struct Inter {
            ↓fileprivate struct Inner {}
        }
    }
```