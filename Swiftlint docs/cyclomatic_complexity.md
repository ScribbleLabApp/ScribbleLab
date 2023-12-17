# Cyclomatic Complexity

Complexity of function bodies should be limited.

* **Identifier:** cyclomatic_complexity
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
  10
  </td>
  </tr>
  <tr>
  <td>
  error
  </td>
  <td>
  20
  </td>
  </tr>
  <tr>
  <td>
  ignores_case_statements
  </td>
  <td>
  false
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
func f1() {
    if true {
        for _ in 1..5 { }
    }
    if false { }
}
```

```swift
func f(code: Int) -> Int {
    switch code {
    case 0: fallthrough
    case 0: return 1
    case 0: return 1
    case 0: return 1
    case 0: return 1
    case 0: return 1
    case 0: return 1
    case 0: return 1
    case 0: return 1
    default: return 1
    }
}
```

```swift
func f1() {
    if true {}; if true {}; if true {}; if true {}; if true {}; if true {}
    func f2() {
        if true {}; if true {}; if true {}; if true {}; if true {}
    }
}
```

## Triggering Examples

```swift
↓func f1() {
    if true {
        if true {
            if false {}
        }
    }
    if false {}
    let i = 0
    switch i {
        case 1: break
        case 2: break
        case 3: break
        case 4: break
        default: break
    }
    for _ in 1...5 {
        guard true else {
            return
        }
    }
}
```