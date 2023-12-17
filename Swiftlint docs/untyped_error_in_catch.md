# Untyped Error in Catch

Catch statements should not declare error variables without type casting

* **Identifier:** untyped_error_in_catch
* **Enabled by default:** No
* **Supports autocorrection:** Yes
* **Kind:** idiomatic
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
do {
  try foo()
} catch {}
```

```swift
do {
  try foo()
} catch Error.invalidOperation {
} catch {}
```

```swift
do {
  try foo()
} catch let error as MyError {
} catch {}
```

```swift
do {
  try foo()
} catch var error as MyError {
} catch {}
```

```swift
do {
    try something()
} catch let e where e.code == .fileError {
    // can be ignored
} catch {
    print(error)
}
```

## Triggering Examples

```swift
do {
  try foo()
} ↓catch var error {}
```

```swift
do {
  try foo()
} ↓catch let error {}
```

```swift
do {
  try foo()
} ↓catch let someError {}
```

```swift
do {
  try foo()
} ↓catch var someError {}
```

```swift
do {
  try foo()
} ↓catch let e {}
```

```swift
do {
  try foo()
} ↓catch(let error) {}
```

```swift
do {
  try foo()
} ↓catch (let error) {}
```