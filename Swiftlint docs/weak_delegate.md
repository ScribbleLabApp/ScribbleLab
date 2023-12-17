# Weak Delegate

Delegates should be weak to avoid reference cycles

* **Identifier:** weak_delegate
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
class Foo {
  weak var delegate: SomeProtocol?
}
```

```swift
class Foo {
  weak var someDelegate: SomeDelegateProtocol?
}
```

```swift
class Foo {
  weak var delegateScroll: ScrollDelegate?
}
```

```swift
class Foo {
  var scrollHandler: ScrollDelegate?
}
```

```swift
func foo() {
  var delegate: SomeDelegate
}
```

```swift
class Foo {
  var delegateNotified: Bool?
}
```

```swift
protocol P {
 var delegate: AnyObject? { get set }
}
```

```swift
class Foo {
 protocol P {
 var delegate: AnyObject? { get set }
}
}
```

```swift
class Foo {
 var computedDelegate: ComputedDelegate {
 return bar() 
} 
}
```

```swift
class Foo {
    var computedDelegate: ComputedDelegate {
        get {
            return bar()
        }
   }
```

```swift
struct Foo {
 @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate 
}
```

```swift
struct Foo {
 @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate 
}
```

```swift
struct Foo {
 @WKExtensionDelegateAdaptor(ExtensionDelegate.self) var extensionDelegate 
}
```

```swift
class Foo {
    func makeDelegate() -> SomeDelegate {
        let delegate = SomeDelegate()
        return delegate
    }
}
```

## Triggering Examples

```swift
class Foo {
  ↓var delegate: SomeProtocol?
}
```

```swift
class Foo {
  ↓var scrollDelegate: ScrollDelegate?
}
```

```swift
class Foo {
    ↓var delegate: SomeProtocol? {
        didSet {
            print("Updated delegate")
        }
   }
```