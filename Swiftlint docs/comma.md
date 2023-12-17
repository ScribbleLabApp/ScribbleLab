# Comma Spacing

There should be no space before and one after any comma

* **Identifier:** comma
* **Enabled by default:** Yes
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
func abc(a: String, b: String) { }
```

```swift
abc(a: "string", b: "string"
```

```swift
enum a { case a, b, c }
```

```swift
func abc(
  a: String,  // comment
  bcd: String // comment
) {
}
```

```swift
func abc(
  a: String,
  bcd: String
) {
}
```

```swift
#imageLiteral(resourceName: "foo,bar,baz")
```

```swift
kvcStringBuffer.advanced(by: rootKVCLength)
  .storeBytes(of: 0x2E /* '.' */, as: CChar.self)
```

## Triggering Examples

```swift
func abc(a: String↓ ,b: String) { }
```

```swift
func abc(a: String↓ ,b: String↓ ,c: String↓ ,d: String) { }
```

```swift
abc(a: "string"↓,b: "string"
```

```swift
enum a { case a↓ ,b }
```

```swift
let result = plus(
    first: 3↓ , // #683
    second: 4
)
```

```swift
Foo(
  parameter: a.b.c,
  tag: a.d,
  value: a.identifier.flatMap { Int64($0) }↓ ,
  reason: Self.abcd()
)
```

```swift
return Foo(bar: .baz, title: fuzz,
          message: My.Custom.message↓ ,
          another: parameter, doIt: true,
          alignment: .center)
```

```swift
Logger.logError("Hat is too large"↓,  info: [])
```