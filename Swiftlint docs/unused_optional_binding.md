# Unused Optional Binding

Prefer `!= nil` over `let _ =`

* **Identifier:** unused_optional_binding
* **Enabled by default:** Yes
* **Supports autocorrection:** No
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
  <tr>
  <td>
  ignore_optional_try
  </td>
  <td>
  false
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
if let bar = Foo.optionalValue {}
```

```swift
if let (_, second) = getOptionalTuple() {}
```

```swift
if let (_, asd, _) = getOptionalTuple(), let bar = Foo.optionalValue {}
```

```swift
if foo() { let _ = bar() }
```

```swift
if foo() { _ = bar() }
```

```swift
if case .some(_) = self {}
```

```swift
if let point = state.find({ _ in true }) {}
```

## Triggering Examples

```swift
if let ↓_ = Foo.optionalValue {}
```

```swift
if let a = Foo.optionalValue, let ↓_ = Foo.optionalValue2 {}
```

```swift
guard let a = Foo.optionalValue, let ↓_ = Foo.optionalValue2 {}
```

```swift
if let (first, second) = getOptionalTuple(), let ↓_ = Foo.optionalValue {}
```

```swift
if let (first, _) = getOptionalTuple(), let ↓_ = Foo.optionalValue {}
```

```swift
if let (_, second) = getOptionalTuple(), let ↓_ = Foo.optionalValue {}
```

```swift
if let ↓(_, _, _) = getOptionalTuple(), let bar = Foo.optionalValue {}
```

```swift
func foo() { if let ↓_ = bar {} }
```