# AnyObject Protocol

Prefer using `AnyObject` over `class` for class-only protocols

* **Identifier:** anyobject_protocol
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
protocol SomeProtocol {}
```

```swift
protocol SomeClassOnlyProtocol: AnyObject {}
```

```swift
protocol SomeClassOnlyProtocol: AnyObject, SomeInheritedProtocol {}
```

```swift
@objc protocol SomeClassOnlyProtocol: AnyObject, SomeInheritedProtocol {}
```

## Triggering Examples

```swift
protocol SomeClassOnlyProtocol: ↓class {}
```

```swift
protocol SomeClassOnlyProtocol: ↓class, SomeInheritedProtocol {}
```

```swift
@objc protocol SomeClassOnlyProtocol: ↓class, SomeInheritedProtocol {}
```