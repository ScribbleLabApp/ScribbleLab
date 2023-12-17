# Quick Discouraged Pending Test

This test won't run as long as it's marked pending

* **Identifier:** quick_discouraged_pending_test
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
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           describe("bar") { }
           context("bar") {
               it("bar") { }
           }
           it("bar") { }
           itBehavesLike("bar")
       }
   }
}
```

## Triggering Examples

```swift
class TotoTests: QuickSpec {
   override func spec() {
       ↓xdescribe("foo") { }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       ↓xcontext("foo") { }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       ↓xit("foo") { }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           ↓xit("bar") { }
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       context("foo") {
           ↓xit("bar") { }
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           context("bar") {
               ↓xit("toto") { }
           }
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       ↓pending("foo")
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       ↓xitBehavesLike("foo")
   }
}
```

```swift
class TotoTests: QuickSpecSubclass {
   override func spec() {
       ↓xitBehavesLike("foo")
   }
}
```