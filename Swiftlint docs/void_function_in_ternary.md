# Void Function in Ternary

Using ternary to call Void functions should be avoided

* **Identifier:** void_function_in_ternary
* **Enabled by default:** Yes
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
let result = success ? foo() : bar()
```

```swift
if success {
    askQuestion()
} else {
    exit()
}
```

```swift
var price: Double {
    return hasDiscount ? calculatePriceWithDiscount() : calculateRegularPrice()
}
```

```swift
foo(x == 2 ? a() : b())
```

```swift
chevronView.image = collapsed ? .icon(.mediumChevronDown) : .icon(.mediumChevronUp)
```

```swift
array.map { elem in
    elem.isEmpty() ? .emptyValue() : .number(elem)
}
```

```swift
func compute(data: [Int]) -> Int {
    data.isEmpty ? 0 : expensiveComputation(data)
}
```

```swift
var value: Int {
    mode == .fast ? fastComputation() : expensiveComputation()
}
```

```swift
var value: Int {
    get {
        mode == .fast ? fastComputation() : expensiveComputation()
    }
}
```

```swift
subscript(index: Int) -> Int {
    get {
        index == 0 ? defaultValue() : compute(index)
    }
```

```swift
subscript(index: Int) -> Int {
    index == 0 ? defaultValue() : compute(index)
```

## Triggering Examples

```swift
success ↓? askQuestion() : exit()
```

```swift
perform { elem in
    elem.isEmpty() ↓? .emptyValue() : .number(elem)
    return 1
}
```

```swift
DispatchQueue.main.async {
    self.sectionViewModels[section].collapsed.toggle()
    self.sectionViewModels[section].collapsed
        ↓? self.tableView.deleteRows(at: [IndexPath(row: 0, section: section)], with: .automatic)
        : self.tableView.insertRows(at: [IndexPath(row: 0, section: section)], with: .automatic)
    self.tableView.scrollToRow(at: IndexPath(row: NSNotFound, section: section), at: .top, animated: true)
}
```

```swift
subscript(index: Int) -> Int {
    index == 0 ↓? something() : somethingElse(index)
    return index
```

```swift
var value: Int {
    mode == .fast ↓? something() : somethingElse()
    return 0
}
```

```swift
var value: Int {
    get {
        mode == .fast ↓? something() : somethingElse()
        return 0
    }
}
```

```swift
subscript(index: Int) -> Int {
    get {
        index == 0 ↓? something() : somethingElse(index)
        return index
    }
```