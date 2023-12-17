# Anonymous Argument in Multiline Closure

Use named arguments in multiline closures

* **Identifier:** anonymous_argument_in_multiline_closure
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
closure { $0 }
```

```swift
closure { print($0) }
```

```swift
closure { arg in
    print(arg)
}
```

```swift
closure { arg in
    nestedClosure { $0 + arg }
}
```

## Triggering Examples

```swift
closure {
    print(↓$0)
}
```