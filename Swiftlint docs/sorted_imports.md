# Sorted Imports

Imports should be sorted

* **Identifier:** sorted_imports
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
  <tr>
  <td>
  grouping
  </td>
  <td>
  names
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
import AAA
import BBB
import CCC
import DDD
```

```swift
import Alamofire
import API
```

```swift
import labc
import Ldef
```

```swift
import BBB
// comment
import AAA
import CCC
```

```swift
@testable import AAA
import   CCC
```

```swift
import AAA
@testable import   CCC
```

```swift
import EEE.A
import FFF.B
#if os(Linux)
import DDD.A
import EEE.B
#else
import CCC
import DDD.B
#endif
import AAA
import BBB
```

## Triggering Examples

```swift
import AAA
import ZZZ
import ↓BBB
import CCC
```

```swift
import DDD
// comment
import CCC
import ↓AAA
```

```swift
@testable import CCC
import   ↓AAA
```

```swift
import CCC
@testable import   ↓AAA
```

```swift
import FFF.B
import ↓EEE.A
#if os(Linux)
import DDD.A
import EEE.B
#else
import DDD.B
import ↓CCC
#endif
import AAA
import BBB
```