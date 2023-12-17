# Indentation Width

Indent code using either one tab or the configured amount of spaces, unindent to match previous indentations. Don't indent the first line.

* **Identifier:** indentation_width
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
  <tr>
  <td>
  indentation_width
  </td>
  <td>
  4
  </td>
  </tr>
  <tr>
  <td>
  include_comments
  </td>
  <td>
  true
  </td>
  </tr>
  <tr>
  <td>
  include_compiler_directives
  </td>
  <td>
  true
  </td>
  </tr>
  <tr>
  <td>
  include_multiline_strings
  </td>
  <td>
  true
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
firstLine
secondLine
```

```swift
firstLine
    secondLine
```

```swift
firstLine
	secondLine
		thirdLine

		fourthLine
```

```swift
firstLine
	secondLine
		thirdLine
	//test
		fourthLine
```

```swift
firstLine
    secondLine
        thirdLine
fourthLine
```

## Triggering Examples

```swift
↓    firstLine
```

```swift
firstLine
        secondLine
```

```swift
firstLine
	secondLine

↓			fourthLine
```

```swift
firstLine
    secondLine
        thirdLine
↓ fourthLine
```