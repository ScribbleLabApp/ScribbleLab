# Return Value from Void Function

Returning values from Void functions should be avoided

* **Identifier:** return_value_from_void_function
* **Enabled by default:** No
* **Supports autocorrection:** No
* **Kind:** idiomatic
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.1.0
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
func foo() {
    return
}
```

```swift
func foo() {
    return /* a comment */
}
```

```swift
func foo() -> Int {
    return 1
}
```

```swift
func foo() -> Void {
    if condition {
        return
    }
    bar()
}
```

```swift
func foo() {
    return;
    bar()
}
```

```swift
func test() {}
```

```swift
init?() {
    guard condition else {
        return nil
    }
}
```

```swift
init?(arg: String?) {
    guard arg != nil else {
        return nil
    }
}
```

```swift
func test() {
    guard condition else {
        return
    }
}
```

```swift
func test() -> Result<String, Error> {
    func other() {}
    func otherVoid() -> Void {}
}
```

```swift
func test() -> Int? {
    return nil
}
```

```swift
func test() {
    if bar {
        print("")
        return
    }
    let foo = [1, 2, 3].filter { return true }
    return
}
```

```swift
func test() {
    guard foo else {
        bar()
        return
    }
}
```

```swift
func spec() {
    var foo: Int {
        return 0
    }
```

## Triggering Examples

```swift
func foo() {
    ↓return bar()
}
```

```swift
func foo() {
    ↓return self.bar()
}
```

```swift
func foo() -> Void {
    ↓return bar()
}
```

```swift
func foo() -> Void {
    ↓return /* comment */ bar()
}
```

```swift
func foo() {
    ↓return
    self.bar()
}
```

```swift
func foo() {
    variable += 1
    ↓return
    variable += 1
}
```

```swift
func initThing() {
    guard foo else {
        ↓return print("")
    }
}
```

```swift
// Leading comment
func test() {
    guard condition else {
        ↓return assertionfailure("")
    }
}
```

```swift
func test() -> Result<String, Error> {
    func other() {
        guard false else {
            ↓return assertionfailure("")
        }
    }
    func otherVoid() -> Void {}
}
```

```swift
func test() {
    guard conditionIsTrue else {
        sideEffects()
        return // comment
    }
    guard otherCondition else {
        ↓return assertionfailure("")
    }
    differentSideEffect()
}
```

```swift
func test() {
    guard otherCondition else {
        ↓return assertionfailure(""); // comment
    }
    differentSideEffect()
}
```

```swift
func test() {
  if x {
    ↓return foo()
  }
  bar()
}
```

```swift
func test() {
  switch x {
    case .a:
      ↓return foo() // return to skip baz()
    case .b:
      bar()
  }
  baz()
}
```

```swift
func test() {
  if check {
    if otherCheck {
      ↓return foo()
    }
  }
  bar()
}
```

```swift
func test() {
    ↓return foo()
}
```

```swift
func test() {
  ↓return foo({
    return bar()
  })
}
```

```swift
func test() {
  guard x else {
    ↓return foo()
  }
  bar()
}
```

```swift
func test() {
  let closure: () -> () = {
    return assert()
  }
  if check {
    if otherCheck {
      return // comments are fine
    }
  }
  ↓return foo()
}
```