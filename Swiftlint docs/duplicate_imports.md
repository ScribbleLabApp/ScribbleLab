# Duplicate Imports

Imports should be unique

* **Identifier:** duplicate_imports
* **Enabled by default:** Yes
* **Supports autocorrection:** Yes
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
import A
import B
import C
```

```swift
import A.B
import A.C
```

```swift
@_implementationOnly import A
@_implementationOnly import B
```

```swift
@testable import A
@testable import B
```

```swift
#if DEBUG
    @testable import KsApi
#else
    import KsApi
#endif
```

```swift
import A // module
import B // module
```

```swift
#if TEST
func test() {
}
```

## Triggering Examples

```swift
@_implementationOnly import A
↓@_implementationOnly import A

```

```swift
@testable import A
↓@testable import A

```

```swift
import A
#if DEBUG
    @testable import KsApi
#else
    import KsApi
#endif
↓import A

```

```swift
import A
↓import class A.Foo

```

```swift
import A
↓import enum A.Foo

```

```swift
import A
↓import func A.Foo

```

```swift
import A
↓import let A.Foo

```

```swift
import A
↓import protocol A.Foo

```

```swift
import A
↓import struct A.Foo

```

```swift
import A
↓import typealias A.Foo

```

```swift
import A
↓import var A.Foo

```

```swift
import A.B
↓import A.B.C

```

```swift
import Foundation
import Dispatch
↓import Foundation

```

```swift
import Foundation
↓import Foundation
↓import Foundation

```

```swift
import Foundation
↓import Foundation.NSString

```

```swift
↓import A.B.C
import A.B

```

```swift
↓import Foundation.NSString
import Foundation

```