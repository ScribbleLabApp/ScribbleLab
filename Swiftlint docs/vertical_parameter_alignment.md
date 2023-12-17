# Vertical Parameter Alignment

Function parameters should be aligned vertically if they're in multiple lines in a declaration

* **Identifier:** vertical_parameter_alignment
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
  </tbody>
  </table>

## Non Triggering Examples

```swift
func validateFunction(_ file: SwiftLintFile, kind: SwiftDeclarationKind,
                      dictionary: SourceKittenDictionary) { }
```

```swift
func validateFunction(_ file: SwiftLintFile, kind: SwiftDeclarationKind,
                      dictionary: SourceKittenDictionary) -> [StyleViolation]
```

```swift
func foo(bar: Int)
```

```swift
func foo(bar: Int) -> String
```

```swift
func validateFunction(_ file: SwiftLintFile, kind: SwiftDeclarationKind,
                      dictionary: SourceKittenDictionary)
                      -> [StyleViolation]
```

```swift
func validateFunction(
   _ file: SwiftLintFile, kind: SwiftDeclarationKind,
   dictionary: SourceKittenDictionary) -> [StyleViolation]
```

```swift
func validateFunction(
   _ file: SwiftLintFile, kind: SwiftDeclarationKind,
   dictionary: SourceKittenDictionary
) -> [StyleViolation]
```

```swift
func regex(_ pattern: String,
           options: NSRegularExpression.Options = [.anchorsMatchLines,
                                                   .dotMatchesLineSeparators]) -> NSRegularExpression
```

```swift
func foo(a: Void,
         b: [String: String] =
         [:]) {
}
```

```swift
func foo(data: (size: CGSize,
                identifier: String)) {}
```

```swift
func foo(data: Data,
         @ViewBuilder content: @escaping (Data.Element.IdentifiedValue) -> Content) {}
```

```swift
class A {
    init(bar: Int)
}
```

```swift
class A {
    init(foo: Int,
         bar: String)
}
```

## Triggering Examples

```swift
func validateFunction(_ file: SwiftLintFile, kind: SwiftDeclarationKind,
                  ↓dictionary: SourceKittenDictionary) { }
```

```swift
func validateFunction(_ file: SwiftLintFile, kind: SwiftDeclarationKind,
                       ↓dictionary: SourceKittenDictionary) { }
```

```swift
func validateFunction(_ file: SwiftLintFile,
                  ↓kind: SwiftDeclarationKind,
                  ↓dictionary: SourceKittenDictionary) { }
```

```swift
func foo(data: Data,
            ↓@ViewBuilder content: @escaping (Data.Element.IdentifiedValue) -> Content) {}
```

```swift
class A {
    init(data: Data,
                ↓@ViewBuilder content: @escaping (Data.Element.IdentifiedValue) -> Content) {}
}
```