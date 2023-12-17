# Direct Return

Directly return the expression instead of assigning it to a variable first

* **Identifier:** direct_return
* **Enabled by default:** No
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
    func f() -> Int {
        let b = 2
        let a = 1
        return b
    }
```

```swift
    struct S {
        var a: Int {
            var b = 1
            b = 2
            return b
        }
    }
```

```swift
    func f() -> Int {
        let b = 2
        f()
        return b
    }
```

```swift
    func f() -> Int {
        { i in
            let b = 2
            return i
        }(1)
    }
```

## Triggering Examples

```swift
    func f() -> Int {
        let ↓b = 2
        return b
    }
```

```swift
    struct S {
        var a: Int {
            var ↓b = 1
            // comment
            return b
        }
    }
```

```swift
    func f() -> Bool {
        let a = 1, ↓b = true
        return b
    }
```

```swift
    func f() -> Int {
        { _ in
            let ↓b = 2
            return b
        }(1)
    }
```

```swift
    func f(i: Int) -> Int {
        if i > 1 {
            let ↓a = 2
            return a
        } else {
            let ↓b = 2, a = 1
            return b
        }
    }
```