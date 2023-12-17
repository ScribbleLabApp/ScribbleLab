# Yoda Condition

The constant literal should be placed on the right-hand side of the comparison operator

* **Identifier:** yoda_condition
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
if foo == 42 {}
```

```swift
if foo <= 42.42 {}
```

```swift
guard foo >= 42 else { return }
```

```swift
guard foo != "str str" else { return }
```

```swift
while foo < 10 { }
```

```swift
while foo > 1 { }
```

```swift
while foo + 1 == 2 {}
```

```swift
if optionalValue?.property ?? 0 == 2 {}
```

```swift
if foo == nil {}
```

```swift
if flags & 1 == 1 {}
```

## Triggering Examples

```swift
if ↓42 == foo {}
```

```swift
if ↓42.42 >= foo {}
```

```swift
guard ↓42 <= foo else { return }
```

```swift
guard ↓"str str" != foo else { return }
```

```swift
while ↓10 > foo { }
```

```swift
while ↓1 < foo { }
```

```swift
if ↓nil == foo {}
```

```swift
while ↓1 > i + 5 {}
```

```swift
if ↓200 <= i && i <= 299 || ↓600 <= i {}
```