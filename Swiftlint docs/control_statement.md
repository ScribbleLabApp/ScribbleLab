# Control Statement

`if`, `for`, `guard`, `switch`, `while`, and `catch` statements shouldn't unnecessarily wrap their conditionals or arguments in parentheses

* **Identifier:** control_statement
* **Enabled by default:** Yes
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
  </tbody>
  </table>

## Non Triggering Examples

```swift
if condition {}
```

```swift
if (a, b) == (0, 1) {}
```

```swift
if (a || b) && (c || d) {}
```

```swift
if (min...max).contains(value) {}
```

```swift
if renderGif(data) {}
```

```swift
renderGif(data)
```

```swift
guard condition else {}
```

```swift
while condition {}
```

```swift
do {} while condition {}
```

```swift
do { ; } while condition {}
```

```swift
switch foo {}
```

```swift
do {} catch let error as NSError {}
```

```swift
foo().catch(all: true) {}
```

```swift
if max(a, b) < c {}
```

```swift
switch (lhs, rhs) {}
```

```swift
if (f() { g() {} }) {}
```

```swift
if (a + f() {} == 1) {}
```

## Triggering Examples

```swift
↓if (condition) {}
```

```swift
↓if(condition) {}
```

```swift
↓if (condition == endIndex) {}
```

```swift
↓if ((a || b) && (c || d)) {}
```

```swift
↓if ((min...max).contains(value)) {}
```

```swift
↓guard (condition) else {}
```

```swift
↓while (condition) {}
```

```swift
↓while(condition) {}
```

```swift
do { ; } ↓while(condition) {}
```

```swift
do { ; } ↓while (condition) {}
```

```swift
↓switch (foo) {}
```

```swift
do {} ↓catch(let error as NSError) {}
```

```swift
↓if (max(a, b) < c) {}
```