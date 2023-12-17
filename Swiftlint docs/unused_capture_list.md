# Unused Capture List

Unused reference in a capture list should be removed

* **Identifier:** unused_capture_list
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
[1, 2].map {
    [ weak
      delegate,
      unowned
      self
    ] num in
    delegate.handle(num)
}
```

```swift
[1, 2].map { [weak self] num in
    self?.handle(num)
}
```

```swift
let failure: Failure = { [weak self, unowned delegate = self.delegate!] foo in
    delegate.handle(foo, self)
}
```

```swift
numbers.forEach({
    [weak handler] in
    handler?.handle($0)
})
```

```swift
withEnvironment(apiService: MockService(fetchProjectResponse: project)) {
    [Device.phone4_7inch, Device.phone5_8inch, Device.pad].forEach { device in
        device.handle()
    }
}
```

```swift
{ [foo] _ in foo.bar() }()
```

```swift
sizes.max().flatMap { [(offset: offset, size: $0)] } ?? []
```

```swift
[1, 2].map { [self] num in
    handle(num)
}
```

```swift
[1, 2].map { [unowned self] num in
    handle(num)
}
```

```swift
[1, 2].map { [self, unowned delegate = self.delegate!] num in
    delegate.handle(num)
}
```

```swift
[1, 2].map { [unowned self, unowned delegate = self.delegate!] num in
    delegate.handle(num)
}
```

```swift
[1, 2].map {
    [ weak
      delegate,
      self
    ] num in
    delegate.handle(num)
}
```

```swift
rx.onViewDidAppear.subscribe(onNext: { [unowned self] in
      doSomething()
}).disposed(by: disposeBag)
```

```swift
let closure = { [weak self] in
    guard let self else {
        return
    }
    someInstanceFunction()
}
```

## Triggering Examples

```swift
[1, 2].map { [↓weak self] num in
    print(num)
}
```

```swift
let failure: Failure = { [weak self, ↓unowned delegate = self.delegate!] foo in
    self?.handle(foo)
}
```

```swift
let failure: Failure = { [↓weak self, ↓unowned delegate = self.delegate!] foo in
    print(foo)
}
```

```swift
numbers.forEach({
    [weak handler] in
    print($0)
})
```

```swift
numbers.forEach({
    [self, ↓weak handler] in
    print($0)
})
```

```swift
withEnvironment(apiService: MockService(fetchProjectResponse: project)) { [↓foo] in
    [Device.phone4_7inch, Device.phone5_8inch, Device.pad].forEach { device in
        device.handle()
    }
}
```

```swift
{ [↓foo] in _ }()
```

```swift
let closure = { [↓weak a] in
    // The new `a` immediatly shadows the captured `a` which thus isn't needed.
    guard let a = getOptionalValue() else {
        return
    }
    someInstanceFunction()
}
```