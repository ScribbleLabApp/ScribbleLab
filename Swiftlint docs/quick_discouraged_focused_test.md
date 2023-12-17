# Quick Discouraged Focused Test

Non-focused tests won't run as long as this test is focused

* **Identifier:** quick_discouraged_focused_test
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
       ↓fdescribe("foo") { }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       ↓fcontext("foo") { }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       ↓fit("foo") { }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           ↓fit("bar") { }
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       context("foo") {
           ↓fit("bar") { }
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           context("bar") {
               ↓fit("toto") { }
           }
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       ↓fitBehavesLike("foo")
   }
}
```

```swift
class TotoTests: QuickSpecSubclass {
   override func spec() {
       ↓fitBehavesLike("foo")
   }
}
```