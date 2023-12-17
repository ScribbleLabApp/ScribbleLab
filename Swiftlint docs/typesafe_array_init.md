# Type-safe Array Init

Prefer using `Array(seq)` over `seq.map { $0 }` to convert a sequence into an Array

* **Identifier:** typesafe_array_init
* **Enabled by default:** No
* **Supports autocorrection:** No
* **Kind:** lint
* **Analyzer rule:** Yes
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
    enum MyError: Error {}
    let myResult: Result<String, MyError> = .success("")
    let result: Result<Any, MyError> = myResult.map { $0 }
```

```swift
    struct IntArray {
        let elements = [1, 2, 3]
        func map<T>(_ transformer: (Int) throws -> T) rethrows -> [T] {
            try elements.map(transformer)
        }
    }
    let ints = IntArray()
    let intsCopy = ints.map { $0 }
```

## Triggering Examples

```swift
    func f<Seq: Sequence>(s: Seq) -> [Seq.Element] {
        s.↓map({ $0 })
    }
```

```swift
    func f(array: [Int]) -> [Int] {
        array.↓map { $0 }
    }
```

```swift
    let myInts = [1, 2, 3].↓map { return $0 }
```

```swift
    struct Generator: Sequence, IteratorProtocol {
        func next() -> Int? { nil }
    }
    let array = Generator().↓map { i in i }
```