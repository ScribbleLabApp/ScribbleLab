# Dynamic Inline

Avoid using 'dynamic' and '@inline(__always)' together

* **Identifier:** dynamic_inline
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
  error
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
class C {
dynamic func f() {}}
```

```swift
class C {
@inline(__always) func f() {}}
```

```swift
class C {
@inline(never) dynamic func f() {}}
```

## Triggering Examples

```swift
class C {
@inline(__always) dynamic ↓func f() {}
}
```

```swift
class C {
@inline(__always) public dynamic ↓func f() {}
}
```

```swift
class C {
@inline(__always) dynamic internal ↓func f() {}
}
```

```swift
class C {
@inline(__always)
dynamic ↓func f() {}
}
```

```swift
class C {
@inline(__always)
dynamic
↓func f() {}
}
```