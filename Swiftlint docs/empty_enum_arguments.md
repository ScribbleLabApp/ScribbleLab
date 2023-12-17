# Empty Enum Arguments

Arguments can be omitted when matching enums with associated values if they are not used

* **Identifier:** empty_enum_arguments
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
switch foo {
case .bar: break
}
```

```swift
switch foo {
case .bar(let x): break
}
```

```swift
switch foo {
case let .bar(x): break
}
```

```swift
switch (foo, bar) {
case (_, _): break
}
```

```swift
switch foo {
case "bar".uppercased(): break
}
```

```swift
switch (foo, bar) {
case (_, _) where !something: break
}
```

```swift
switch foo {
case (let f as () -> String)?: break
}
```

```swift
switch foo {
case .bar(Baz()): break
}
```

```swift
switch foo {
case .bar(.init()): break
}
```

```swift
switch foo {
default: break
}
```

```swift
if case .bar = foo {
}
```

```swift
guard case .bar = foo else {
}
```

```swift
if foo == .bar() {}
```

```swift
guard foo == .bar() else { return }
```

```swift
if case .appStore = self.appInstaller, !UIDevice.isSimulator() {
  viewController.present(self, animated: false)
} else {
  UIApplication.shared.open(self.appInstaller.url)
}
```

```swift
let updatedUserNotificationSettings = deepLink.filter { nav in
  guard case .settings(.notifications(_, nil)) = nav else { return false }
  return true
}
```

## Triggering Examples

```swift
switch foo {
case .bar↓(_): break
}
```

```swift
switch foo {
case .bar↓(): break
}
```

```swift
switch foo {
case .bar↓(_), .bar2↓(_): break
}
```

```swift
switch foo {
case .bar↓() where method() > 2: break
}
```

```swift
switch foo {
case .bar(.baz↓()): break
}
```

```swift
switch foo {
case .bar(.baz↓(_)): break
}
```

```swift
func example(foo: Foo) {
    switch foo {
    case case .bar↓(_):
        break
    }
}
```

```swift
if case .bar↓(_) = foo {
}
```

```swift
guard case .bar↓(_) = foo else {
}
```

```swift
if case .bar↓() = foo {
}
```

```swift
guard case .bar↓() = foo else {
}
```

```swift
if case .appStore↓(_) = self.appInstaller, !UIDevice.isSimulator() {
  viewController.present(self, animated: false)
} else {
  UIApplication.shared.open(self.appInstaller.url)
}
```

```swift
let updatedUserNotificationSettings = deepLink.filter { nav in
  guard case .settings(.notifications↓(_, _)) = nav else { return false }
  return true
}
```