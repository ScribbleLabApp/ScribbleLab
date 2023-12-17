# Private Actions

IBActions should be private

* **Identifier:** private_action
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
	@IBAction private func barButtonTapped(_ sender: UIButton) {}
}
```

```swift
struct Foo {
	@IBAction private func barButtonTapped(_ sender: UIButton) {}
}
```

```swift
class Foo {
	@IBAction fileprivate func barButtonTapped(_ sender: UIButton) {}
}
```

```swift
struct Foo {
	@IBAction fileprivate func barButtonTapped(_ sender: UIButton) {}
}
```

```swift
private extension Foo {
	@IBAction func barButtonTapped(_ sender: UIButton) {}
}
```

```swift
fileprivate extension Foo {
	@IBAction func barButtonTapped(_ sender: UIButton) {}
}
```

## Triggering Examples

```swift
class Foo {
	@IBAction ↓func barButtonTapped(_ sender: UIButton) {}
}
```

```swift
struct Foo {
	@IBAction ↓func barButtonTapped(_ sender: UIButton) {}
}
```

```swift
class Foo {
	@IBAction public ↓func barButtonTapped(_ sender: UIButton) {}
}
```

```swift
struct Foo {
	@IBAction public ↓func barButtonTapped(_ sender: UIButton) {}
}
```

```swift
class Foo {
	@IBAction internal ↓func barButtonTapped(_ sender: UIButton) {}
}
```

```swift
struct Foo {
	@IBAction internal ↓func barButtonTapped(_ sender: UIButton) {}
}
```

```swift
extension Foo {
	@IBAction ↓func barButtonTapped(_ sender: UIButton) {}
}
```

```swift
extension Foo {
	@IBAction public ↓func barButtonTapped(_ sender: UIButton) {}
}
```

```swift
extension Foo {
	@IBAction internal ↓func barButtonTapped(_ sender: UIButton) {}
}
```

```swift
public extension Foo {
	@IBAction ↓func barButtonTapped(_ sender: UIButton) {}
}
```

```swift
internal extension Foo {
	@IBAction ↓func barButtonTapped(_ sender: UIButton) {}
}
```