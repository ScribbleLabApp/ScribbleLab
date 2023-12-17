# Vertical Whitespace after Opening Braces

Don't include vertical whitespace (empty line) after opening braces

* **Identifier:** vertical_whitespace_opening_braces
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
/*
    class X {

        let x = 5

    }
*/
```

```swift
// [1, 2].map { $0 }.filter { num in true }
```

```swift
KingfisherManager.shared.retrieveImage(with: url, options: nil, progressBlock: nil) { image, _, _, _ in
    guard let img = image else { return }
}
```

```swift
[
1,
2,
3
]
```

```swift
[1, 2].map { $0 }.filter { num in true }
```

```swift
[1, 2].map { $0 }.foo()
```

```swift
class X {
  struct Y {
    class Z {
    }
  }
}
```

```swift
foo(
  x: 5,
  y:6
)
```

```swift
foo({ }) { _ in
  self.dismiss(animated: false, completion: {
  })
}
```

```swift
func foo() {
  run(5) { x in
    print(x)
  }
}
```

```swift
if x == 5 {
  print("x is 5")
}
```

```swift
if x == 5 {
  print("x is 5")
}
```

```swift
struct MyStruct {
  let x = 5
}
```

## Triggering Examples

```swift
KingfisherManager.shared.retrieveImage(with: url, options: nil, progressBlock: nil) { image, _, _, _ in
↓
    guard let img = image else { return }
}
```

```swift
[
↓
1,
2,
3
]
```

```swift
class X {
  struct Y {
↓
    class Z {
    }
  }
}
```

```swift
foo(
↓
  x: 5,
  y:6
)
```

```swift
foo({ }) { _ in
↓
  self.dismiss(animated: false, completion: {
  })
}
```

```swift
func foo() {
↓
  run(5) { x in
    print(x)
  }
}
```

```swift
if x == 5 {
↓

  print("x is 5")
}
```

```swift
if x == 5 {
↓
  print("x is 5")
}
```

```swift
struct MyStruct {
↓
  let x = 5
}
```