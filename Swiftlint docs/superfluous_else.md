# Superfluous Else

Else branches should be avoided when the previous if-block exits the current scope

* **Identifier:** superfluous_else
* **Enabled by default:** No
* **Supports autocorrection:** No
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
  </tbody>
  </table>

## Non Triggering Examples

```swift
    if i > 0 {
        // comment
    } else if i < 12 {
        return 2
    } else {
        return 3
    }
```

```swift
    if i > 0 {
        let a = 1
        if a > 1 {
            // comment
        } else {
            return 1
        }
        // comment
    } else {
        return 3
    }
```

```swift
    if i > 0 {
        if a > 1 {
            return 1
        }
    } else {
        return 3
    }
```

## Triggering Examples

```swift
    ↓if i > 0 {
        return 1
        // comment
    } else {
        return 2
    }
```

```swift
    ↓if i > 0 {
        return 1
    } else ↓if i < 12 {
        return 2
    } else if i > 18 {
        return 3
    }
```

```swift
    ↓if i > 0 {
        ↓if i < 12 {
            return 5
        } else {
            ↓if i > 11 {
                return 6
            } else {
                return 7
            }
        }
    } else ↓if i < 12 {
        return 2
    } else ↓if i < 24 {
        return 8
    } else {
        return 3
    }
```