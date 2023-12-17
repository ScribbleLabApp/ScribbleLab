# Duplicated Key in Dictionary Literal

Dictionary literals with duplicated keys will crash at runtime

* **Identifier:** duplicated_key_in_dictionary_literal
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
  </tbody>
  </table>

## Non Triggering Examples

```swift
    [
        1: "1",
        2: "2"
    ]
```

```swift
    [
        "1": 1,
        "2": 2
    ]
```

```swift
    [
        foo: "1",
        bar: "2"
    ]
```

```swift
    [
        UUID(): "1",
        UUID(): "2"
    ]
```

```swift
    [
        #line: "1",
        #line: "2"
    ]
```

## Triggering Examples

```swift
    [
        1: "1",
        2: "2",
        ↓1: "one"
    ]
```

```swift
    [
        "1": 1,
        "2": 2,
        ↓"2": 2
    ]
```

```swift
    [
        foo: "1",
        bar: "2",
        baz: "3",
        ↓foo: "4",
        zaz: "5"
    ]
```

```swift
    [
        .one: "1",
        .two: "2",
        .three: "3",
        ↓.one: "1",
        .four: "4",
        .five: "5"
    ]
```