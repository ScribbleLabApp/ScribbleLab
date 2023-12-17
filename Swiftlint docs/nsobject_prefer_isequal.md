# NSObject Prefer isEqual

NSObject subclasses should implement isEqual instead of ==

* **Identifier:** nsobject_prefer_isequal
* **Enabled by default:** Yes
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
class AClass: NSObject {
}
```

```swift
@objc class AClass: SomeNSObjectSubclass {
}
```

```swift
class AClass: Equatable {
    static func ==(lhs: AClass, rhs: AClass) -> Bool {
        return true
    }
```

```swift
class AClass: NSObject {
    override func isEqual(_ object: Any?) -> Bool {
        return true
    }
}
```

```swift
@objc class AClass: SomeNSObjectSubclass {
    override func isEqual(_ object: Any?) -> Bool {
        return false
    }
}
```

```swift
class AClass: NSObject {
    static func ==(lhs: AClass, rhs: BClass) -> Bool {
        return true
    }
}
```

```swift
struct AStruct: Equatable {
    static func ==(lhs: AStruct, rhs: AStruct) -> Bool {
        return false
    }
}
```

```swift
enum AnEnum: Equatable {
    static func ==(lhs: AnEnum, rhs: AnEnum) -> Bool {
        return true
    }
}
```

## Triggering Examples

```swift
class AClass: NSObject {
    ↓static func ==(lhs: AClass, rhs: AClass) -> Bool {
        return false
    }
}
```

```swift
@objc class AClass: SomeOtherNSObjectSubclass {
    ↓static func ==(lhs: AClass, rhs: AClass) -> Bool {
        return true
    }
}
```

```swift
class AClass: NSObject, Equatable {
    ↓static func ==(lhs: AClass, rhs: AClass) -> Bool {
        return false
    }
}
```

```swift
class AClass: NSObject {
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? AClass else {
            return false
        }
        return true
    }

    ↓static func ==(lhs: AClass, rhs: AClass) -> Bool {
        return false
    }
}
```