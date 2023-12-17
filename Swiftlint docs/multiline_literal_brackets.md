# Multiline Literal Brackets

Multiline literals should have their surrounding brackets in a new line

* **Identifier:** multiline_literal_brackets
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
let trio = ["harry", "ronald", "hermione"]
let houseCup = ["gryffindor": 460, "hufflepuff": 370, "ravenclaw": 410, "slytherin": 450]
```

```swift
let trio = [
    "harry",
    "ronald",
    "hermione"
]
let houseCup = [
    "gryffindor": 460,
    "hufflepuff": 370,
    "ravenclaw": 410,
    "slytherin": 450
]
```

```swift
let trio = [
    "harry", "ronald", "hermione"
]
let houseCup = [
    "gryffindor": 460, "hufflepuff": 370,
    "ravenclaw": 410, "slytherin": 450
]
```

```swift
    _ = [
        1,
        2,
        3,
        4,
        5, 6,
        7, 8, 9
    ]
```

## Triggering Examples

```swift
let trio = [↓"harry",
            "ronald",
            "hermione"
]
```

```swift
let houseCup = [↓"gryffindor": 460, "hufflepuff": 370,
                "ravenclaw": 410, "slytherin": 450
]
```

```swift
let houseCup = [↓"gryffindor": 460,
                "hufflepuff": 370,
                "ravenclaw": 410,
                "slytherin": 450↓]
```

```swift
let trio = [
    "harry",
    "ronald",
    "hermione"↓]
```

```swift
let houseCup = [
    "gryffindor": 460, "hufflepuff": 370,
    "ravenclaw": 410, "slytherin": 450↓]
```

```swift
class Hogwarts {
    let houseCup = [
        "gryffindor": 460, "hufflepuff": 370,
        "ravenclaw": 410, "slytherin": 450↓]
}
```

```swift
    _ = [
        1,
        2,
        3,
        4,
        5, 6,
        7, 8, 9↓]
```

```swift
    _ = [↓1, 2, 3,
         4, 5, 6,
         7, 8, 9
    ]
```