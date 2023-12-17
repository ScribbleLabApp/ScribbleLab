# Unused Control Flow Label

Unused control flow label should be removed

* **Identifier:** unused_control_flow_label
* **Enabled by default:** Yes
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
loop: while true { break loop }
```

```swift
loop: while true { continue loop }
```

```swift
loop:
    while true { break loop }
```

```swift
while true { break }
```

```swift
loop: for x in array { break loop }
```

```swift
label: switch number {
case 1: print("1")
case 2: print("2")
default: break label
}
```

```swift
loop: repeat {
    if x == 10 {
        break loop
    }
} while true
```

## Triggering Examples

```swift
↓loop: while true { break }
```

```swift
↓loop: while true { break loop1 }
```

```swift
↓loop: while true { break outerLoop }
```

```swift
↓loop: for x in array { break }
```

```swift
↓label: switch number {
case 1: print("1")
case 2: print("2")
default: break
}
```

```swift
↓loop: repeat {
    if x == 10 {
        break
    }
} while true
```