# Blanket Disable Command

swiftlint:disable commands should be re-enabled before the end of the file

* **Identifier:** blanket_disable_command
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
  <tr>
  <td>
  allowed_rules
  </td>
  <td>
  [&quot;file_header&quot;, &quot;file_length&quot;, &quot;file_name&quot;, &quot;file_name_no_space&quot;, &quot;single_test_class&quot;]
  </td>
  </tr>
  <tr>
  <td>
  always_blanket_disable
  </td>
  <td>
  []
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
// swiftlint:disable unused_import
// swiftlint:enable unused_import
```

```swift
// swiftlint:disable unused_import unused_declaration
// swiftlint:enable unused_import
// swiftlint:enable unused_declaration
```

```swift
// swiftlint:disable:this unused_import
```

```swift
// swiftlint:disable:next unused_import
```

```swift
// swiftlint:disable:previous unused_import
```

## Triggering Examples

```swift
// swiftlint:disable ↓unused_import
```

```swift
// swiftlint:disable unused_import ↓unused_declaration
// swiftlint:enable unused_import
```

```swift
// swiftlint:disable unused_import
// swiftlint:disable ↓unused_import
// swiftlint:enable unused_import
```

```swift
// swiftlint:enable ↓unused_import
```