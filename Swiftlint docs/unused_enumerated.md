# Unused Enumerated

When the index or the item is not used, `.enumerated()` can be removed.

* **Identifier:** unused_enumerated
* **Enabled by default:** Yes
* **Supports autocorrection:** No
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
for (idx, foo) in bar.enumerated() { }
```

```swift
for (_, foo) in bar.enumerated().something() { }
```

```swift
for (_, foo) in bar.something() { }
```

```swift
for foo in bar.enumerated() { }
```

```swift
for foo in bar { }
```

```swift
for (idx, _) in bar.enumerated().something() { }
```

```swift
for (idx, _) in bar.something() { }
```

```swift
for idx in bar.indices { }
```

```swift
for (section, (event, _)) in data.enumerated() {}
```

## Triggering Examples

```swift
for (↓_, foo) in bar.enumerated() { }
```

```swift
for (↓_, foo) in abc.bar.enumerated() { }
```

```swift
for (↓_, foo) in abc.something().enumerated() { }
```

```swift
for (idx, ↓_) in bar.enumerated() { }
```