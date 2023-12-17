# Explicit Top Level ACL

Top-level declarations should specify Access Control Level keywords explicitly

* **Identifier:** explicit_top_level_acl
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
internal enum A {}
```

```swift
public final class B {}
```

```swift
private struct C {}
```

```swift
internal enum A { enum B {} }
```

```swift
internal final class Foo {}
```

```swift
internal
class Foo {}
```

```swift
internal func a() {}
```

```swift
extension A: Equatable {}
```

```swift
extension A {}
```

## Triggering Examples

```swift
↓enum A {}
```

```swift
final ↓class B {}
```

```swift
↓struct C {}
```

```swift
↓func a() {}
```

```swift
internal let a = 0
↓func b() {}
```