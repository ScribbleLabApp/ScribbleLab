# Number Separator

Underscores should be used as thousand separator in large numbers with a configurable number of digits. In other words, there should be an underscore after every 3 digits in the integral as well as the fractional part of a number.

* **Identifier:** number_separator
* **Enabled by default:** No
* **Supports autocorrection:** Yes
* **Kind:** style
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
  minimum_length
  </td>
  <td>
  0
  </td>
  </tr>
  <tr>
  <td>
  exclude_ranges
  </td>
  <td>
  []
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
let foo = -100
```

```swift
let foo = -1_000
```

```swift
let foo = -1_000_000
```

```swift
let foo = -1.0001
```

```swift
let foo = -1_000_000.0000001
```

```swift
let binary = -0b10000
```

```swift
let binary = -0b1000_0001
```

```swift
let hex = -0xA
```

```swift
let hex = -0xAA_BB
```

```swift
let octal = -0o21
```

```swift
let octal = -0o21_1
```

```swift
let exp = -1_000_000.000000e2
```

```swift
let foo: Double = -(200)
```

```swift
let foo: Double = -(200 / 447.214)
```

```swift
let foo = -6.2832e-6
```

```swift
let foo = +100
```

```swift
let foo = +1_000
```

```swift
let foo = +1_000_000
```

```swift
let foo = +1.0001
```

```swift
let foo = +1_000_000.0000001
```

```swift
let binary = +0b10000
```

```swift
let binary = +0b1000_0001
```

```swift
let hex = +0xA
```

```swift
let hex = +0xAA_BB
```

```swift
let octal = +0o21
```

```swift
let octal = +0o21_1
```

```swift
let exp = +1_000_000.000000e2
```

```swift
let foo: Double = +(200)
```

```swift
let foo: Double = +(200 / 447.214)
```

```swift
let foo = +6.2832e-6
```

```swift
let foo = 100
```

```swift
let foo = 1_000
```

```swift
let foo = 1_000_000
```

```swift
let foo = 1.0001
```

```swift
let foo = 1_000_000.0000001
```

```swift
let binary = 0b10000
```

```swift
let binary = 0b1000_0001
```

```swift
let hex = 0xA
```

```swift
let hex = 0xAA_BB
```

```swift
let octal = 0o21
```

```swift
let octal = 0o21_1
```

```swift
let exp = 1_000_000.000000e2
```

```swift
let foo: Double = (200)
```

```swift
let foo: Double = (200 / 447.214)
```

```swift
let foo = 6.2832e-6
```

## Triggering Examples

```swift
let foo = -↓10_0
```

```swift
let foo = -↓1000
```

```swift
let foo = -↓1000e2
```

```swift
let foo = -↓1000E2
```

```swift
let foo = -↓1__000
```

```swift
let foo = -↓1.0001
```

```swift
let foo = -↓1_000_000.000000_1
```

```swift
let foo = -↓1000000.000000_1
```

```swift
let foo = -↓6.2832e-6
```

```swift
let foo = +↓10_0
```

```swift
let foo = +↓1000
```

```swift
let foo = +↓1000e2
```

```swift
let foo = +↓1000E2
```

```swift
let foo = +↓1__000
```

```swift
let foo = +↓1.0001
```

```swift
let foo = +↓1_000_000.000000_1
```

```swift
let foo = +↓1000000.000000_1
```

```swift
let foo = +↓6.2832e-6
```

```swift
let foo = ↓10_0
```

```swift
let foo = ↓1000
```

```swift
let foo = ↓1000e2
```

```swift
let foo = ↓1000E2
```

```swift
let foo = ↓1__000
```

```swift
let foo = ↓1.0001
```

```swift
let foo = ↓1_000_000.000000_1
```

```swift
let foo = ↓1000000.000000_1
```

```swift
let foo = ↓6.2832e-6
```

```swift
let foo: Double = -(↓100000)
```

```swift
let foo: Double = -(↓10.000000_1)
```

```swift
let foo: Double = -(↓123456 / ↓447.214214)
```

```swift
let foo: Double = +(↓100000)
```

```swift
let foo: Double = +(↓10.000000_1)
```

```swift
let foo: Double = +(↓123456 / ↓447.214214)
```

```swift
let foo: Double = (↓100000)
```

```swift
let foo: Double = (↓10.000000_1)
```

```swift
let foo: Double = (↓123456 / ↓447.214214)
```