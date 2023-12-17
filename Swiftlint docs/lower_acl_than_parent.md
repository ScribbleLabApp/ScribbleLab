# Lower ACL than Parent

Ensure declarations have a lower access control level than their enclosing parent

* **Identifier:** lower_acl_than_parent
* **Enabled by default:** No
* **Supports autocorrection:** Yes
* **Kind:** lint
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
public struct Foo { public func bar() {} }
```

```swift
internal struct Foo { func bar() {} }
```

```swift
struct Foo { func bar() {} }
```

```swift
struct Foo { internal func bar() {} }
```

```swift
open class Foo { public func bar() {} }
```

```swift
open class Foo { open func bar() {} }
```

```swift
fileprivate struct Foo { private func bar() {} }
```

```swift
private struct Foo { private func bar(id: String) }
```

```swift
extension Foo { public func bar() {} }
```

```swift
private struct Foo { fileprivate func bar() {} }
```

```swift
private func foo(id: String) {}
```

```swift
private class Foo { func bar() {} }
```

```swift
public extension Foo { struct Bar { public func baz() {} }}
```

```swift
public extension Foo { struct Bar { internal func baz() {} }}
```

```swift
internal extension Foo { struct Bar { internal func baz() {} }}
```

```swift
extension Foo { struct Bar { internal func baz() {} }}
```

## Triggering Examples

```swift
struct Foo { ↓public func bar() {} }
```

```swift
enum Foo { ↓public func bar() {} }
```

```swift
public class Foo { ↓open func bar() }
```

```swift
class Foo { ↓public private(set) var bar: String? }
```

```swift
private struct Foo { ↓public func bar() {} }
```

```swift
private class Foo { ↓public func bar() {} }
```

```swift
private actor Foo { ↓public func bar() {} }
```

```swift
fileprivate struct Foo { ↓public func bar() {} }
```

```swift
class Foo { ↓public func bar() {} }
```

```swift
actor Foo { ↓public func bar() {} }
```

```swift
private struct Foo { ↓internal func bar() {} }
```

```swift
fileprivate struct Foo { ↓internal func bar() {} }
```

```swift
extension Foo { struct Bar { ↓public func baz() {} }}
```

```swift
internal extension Foo { struct Bar { ↓public func baz() {} }}
```

```swift
private extension Foo { struct Bar { ↓public func baz() {} }}
```

```swift
fileprivate extension Foo { struct Bar { ↓public func baz() {} }}
```

```swift
private extension Foo { struct Bar { ↓internal func baz() {} }}
```

```swift
fileprivate extension Foo { struct Bar { ↓internal func baz() {} }}
```

```swift
public extension Foo { struct Bar { struct Baz { ↓public func qux() {} }}}
```

```swift
final class Foo { ↓public func bar() {} }
```