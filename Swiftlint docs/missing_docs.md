# Missing Docs

Declarations should be documented.

* **Identifier:** missing_docs
* **Enabled by default:** No
* **Supports autocorrection:** No
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
  warning
  </td>
  <td>
  [open, public]
  </td>
  </tr>
  <tr>
  <td>
  excludes_extensions
  </td>
  <td>
  true
  </td>
  </tr>
  <tr>
  <td>
  excludes_inherited_types
  </td>
  <td>
  true
  </td>
  </tr>
  <tr>
  <td>
  excludes_trivial_init
  </td>
  <td>
  false
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
/// docs
public class A {
/// docs
public func b() {}
}
// no docs
public class B: A { override public func b() {} }
```

```swift
import Foundation
// no docs
public class B: NSObject {
// no docs
override public var description: String { fatalError() } }
```

```swift
/// docs
public class A {
    deinit {}
}
```

```swift
public extension A {}
```

```swift
/// docs
public class A {
    public init() {}
}
```

## Triggering Examples

```swift
public func a() {}
```

```swift
// regular comment
public func a() {}
```

```swift
/* regular comment */
public func a() {}
```

```swift
/// docs
public protocol A {
// no docs
var b: Int { get } }
/// docs
public struct C: A {

public let b: Int
}
```

```swift
/// docs
public class A {
    public init(argument: String) {}
}
```