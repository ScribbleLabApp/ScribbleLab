# Expiring Todo

TODOs and FIXMEs should be resolved prior to their expiry date.

* **Identifier:** expiring_todo
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
  approaching_expiry_severity
  </td>
  <td>
  warning
  </td>
  </tr>
  <tr>
  <td>
  expired_severity
  </td>
  <td>
  error
  </td>
  </tr>
  <tr>
  <td>
  bad_formatting_severity
  </td>
  <td>
  error
  </td>
  </tr>
  <tr>
  <td>
  approaching_expiry_threshold
  </td>
  <td>
  15
  </td>
  </tr>
  <tr>
  <td>
  date_delimiters
  </td>
  <td>
  <table>
  <thead>
  <tr><th>Key</th><th>Value</th></tr>
  </thead>
  <tbody>
  <tr>
  <td>
  opening
  </td>
  <td>
  &quot;[&quot;
  </td>
  </tr>
  <tr>
  <td>
  closing
  </td>
  <td>
  &quot;]&quot;
  </td>
  </tr>
  </tbody>
  </table>
  </td>
  </tr>
  <tr>
  <td>
  date_format
  </td>
  <td>
  &quot;MM/dd/yyyy&quot;
  </td>
  </tr>
  <tr>
  <td>
  date_separator
  </td>
  <td>
  &quot;/&quot;
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
// notaTODO:
```

```swift
// notaFIXME:
```

```swift
// TODO: [12/31/9999]
```

```swift
// TODO(note)
```

```swift
// FIXME(note)
```

```swift
/* FIXME: */
```

```swift
/* TODO: */
```

```swift
/** FIXME: */
```

```swift
/** TODO: */
```

## Triggering Examples

```swift
// TODO: [↓10/14/2019]
```

```swift
// FIXME: [↓10/14/2019]
```

```swift
// FIXME: [↓1/14/2019]
```

```swift
// FIXME: [↓10/14/2019]
```

```swift
// TODO: [↓9999/14/10]
```