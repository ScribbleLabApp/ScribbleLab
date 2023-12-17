# Quick Discouraged Call

Discouraged call inside 'describe' and/or 'context' block.

* **Identifier:** quick_discouraged_call
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
class TotoTests {
   override func spec() {
       describe("foo") {
           let foo = Foo()
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           beforeEach {
               let foo = Foo()
               foo.toto()
           }
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           beforeEach {
               let foo = Foo()
               foo.toto()
           }
           afterEach {
               let foo = Foo()
               foo.toto()
           }
           describe("bar") {
           }
           context("bar") {
           }
           it("bar") {
               let foo = Foo()
               foo.toto()
           }
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           justBeforeEach {
               let foo = Foo()
               foo.toto()
           }
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           aroundEach {
               let foo = Foo()
               foo.toto()
           }
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
          itBehavesLike("bar")
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           it("does something") {
               let foo = Foo()
               foo.toto()
           }
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       context("foo") {
           afterEach { toto.append(foo) }
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       xcontext("foo") {
           afterEach { toto.append(foo) }
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       xdescribe("foo") {
           afterEach { toto.append(foo) }
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           xit("does something") {
               let foo = Foo()
               foo.toto()
           }
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       fcontext("foo") {
           afterEach { toto.append(foo) }
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       fdescribe("foo") {
           afterEach { toto.append(foo) }
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           fit("does something") {
               let foo = Foo()
               foo.toto()
           }
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       fitBehavesLike("foo")
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       xitBehavesLike("foo")
   }
}
```

## Triggering Examples

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           let foo = ↓Foo()
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override static func spec() {
       describe("foo") {
           let foo = ↓Foo()
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           let foo = ↓Foo()
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           context("foo") {
               let foo = ↓Foo()
           }
           context("bar") {
               let foo = ↓Foo()
               ↓foo.bar()
               it("does something") {
                   let foo = Foo()
                   foo.toto()
               }
           }
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           context("foo") {
               context("foo") {
                   beforeEach {
                       let foo = Foo()
                       foo.toto()
                   }
                   it("bar") {
                   }
                   context("foo") {
                       let foo = ↓Foo()
                   }
               }
           }
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       context("foo") {
           let foo = ↓Foo()
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       sharedExamples("foo") {
           let foo = ↓Foo()
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           ↓foo()
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       context("foo") {
           ↓foo()
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       sharedExamples("foo") {
           ↓foo()
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       xdescribe("foo") {
           let foo = ↓Foo()
       }
       fdescribe("foo") {
           let foo = ↓Foo()
       }
   }
}
```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       xcontext("foo") {
           let foo = ↓Foo()
       }
       fcontext("foo") {
           let foo = ↓Foo()
       }
   }
}
```

```swift
class TotoTests: QuickSpecSubclass {
   override func spec() {
       xcontext("foo") {
           let foo = ↓Foo()
       }
       fcontext("foo") {
           let foo = ↓Foo()
       }
   }
}
```