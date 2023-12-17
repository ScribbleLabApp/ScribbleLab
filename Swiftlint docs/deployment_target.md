# Deployment Target

Availability checks or attributes shouldn't be using older versions that are satisfied by the deployment target.

* **Identifier:** deployment_target
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
  <tr>
  <td>
  iOSApplicationExtension_deployment_target
  </td>
  <td>
  7.0
  </td>
  </tr>
  <tr>
  <td>
  iOS_deployment_target
  </td>
  <td>
  7.0
  </td>
  </tr>
  <tr>
  <td>
  macOSApplicationExtension_deployment_target
  </td>
  <td>
  10.9
  </td>
  </tr>
  <tr>
  <td>
  macOS_deployment_target
  </td>
  <td>
  10.9
  </td>
  </tr>
  <tr>
  <td>
  tvOSApplicationExtension_deployment_target
  </td>
  <td>
  9.0
  </td>
  </tr>
  <tr>
  <td>
  tvOS_deployment_target
  </td>
  <td>
  9.0
  </td>
  </tr>
  <tr>
  <td>
  watchOSApplicationExtension_deployment_target
  </td>
  <td>
  1.0
  </td>
  </tr>
  <tr>
  <td>
  watchOS_deployment_target
  </td>
  <td>
  1.0
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
@available(iOS 12.0, *)
class A {}
```

```swift
@available(iOSApplicationExtension 13.0, *)
class A {}
```

```swift
@available(watchOS 4.0, *)
class A {}
```

```swift
@available(watchOSApplicationExtension 4.0, *)
class A {}
```

```swift
@available(swift 3.0.2)
class A {}
```

```swift
class A {}
```

```swift
if #available(iOS 10.0, *) {}
```

```swift
if #available(iOS 10, *) {}
```

```swift
guard #available(iOS 12.0, *) else { return }
```

```swift
#if #unavailable(iOS 15.0) {}
```

```swift
#guard #unavailable(iOS 15.0) {} else { return }
```

## Triggering Examples

```swift
↓@available(iOS 6.0, *)
class A {}
```

```swift
↓@available(iOSApplicationExtension 6.0, *)
class A {}
```

```swift
↓@available(iOS 7.0, *)
class A {}
```

```swift
↓@available(iOS 6, *)
class A {}
```

```swift
↓@available(iOS 6.0, macOS 10.12, *)
 class A {}
```

```swift
↓@available(macOS 10.12, iOS 6.0, *)
 class A {}
```

```swift
↓@available(macOS 10.7, *)
class A {}
```

```swift
↓@available(macOSApplicationExtension 10.7, *)
class A {}
```

```swift
↓@available(OSX 10.7, *)
class A {}
```

```swift
↓@available(watchOS 0.9, *)
class A {}
```

```swift
↓@available(watchOSApplicationExtension 0.9, *)
class A {}
```

```swift
↓@available(tvOS 8, *)
class A {}
```

```swift
↓@available(tvOSApplicationExtension 8, *)
class A {}
```

```swift
if ↓#available(iOS 6.0, *) {}
```

```swift
if ↓#available(iOS 6, *) {}
```

```swift
guard ↓#available(iOS 6.0, *) else { return }
```

```swift
if ↓#unavailable(iOS 7.0) {}
```

```swift
if ↓#unavailable(iOS 6.9) {}
```

```swift
guard ↓#unavailable(iOS 7.0) {} else { return }
```