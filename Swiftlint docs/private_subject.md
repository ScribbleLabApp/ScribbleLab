# Private Combine Subject

Combine Subject should be private

* **Identifier:** private_subject
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
final class Foobar {
    private let goodSubject = PassthroughSubject<Bool, Never>()
}
```

```swift
final class Foobar {
    private let goodSubject: PassthroughSubject<Bool, Never>
}
```

```swift
final class Foobar {
    fileprivate let goodSubject: PassthroughSubject<Bool, Never>
}
```

```swift
final class Foobar {
    private let goodSubject: PassthroughSubject<Bool, Never> = .init()
}
```

```swift
final class Foobar {
    private let goodSubject = CurrentValueSubject<Bool, Never>(false)
}
```

```swift
final class Foobar {
    private let goodSubject: CurrentValueSubject<Bool, Never>
}
```

```swift
final class Foobar {
    fileprivate let goodSubject: CurrentValueSubject<String, Never>
}
```

```swift
final class Foobar {
    private let goodSubject: CurrentValueSubject<String, Never> = .init("toto")
}
```

```swift
final class Foobar {
    private let goodSubject = PassthroughSubject<Set<String>, Never>()
}
```

```swift
final class Foobar {
    private let goodSubject: PassthroughSubject<Set<String>, Never> = .init()
}
```

```swift
final class Foobar {
    private let goodSubject: CurrentValueSubject<Set<String>, Never> = .init([])
}
```

```swift
final class Foobar {
    private let goodSubject =
        PassthroughSubject<Bool, Never>()
}
```

```swift
final class Foobar {
    private let goodSubject:
        PassthroughSubject<Bool, Never> = .init()
}
```

```swift
final class Foobar {
    private let goodSubject =
        CurrentValueSubject<Bool, Never>(true)
}
```

```swift
final class Foobar {
    private let goodSubject: CurrentValueSubject<Bool, Never>
    init() {
        let goodSubject = CurrentValueSubject<Bool, Never>(true)
        self.goosSubject = goodSubject
    }
}
```

```swift
func foo() {
    let goodSubject = PassthroughSubject<Bool, Never>(true)
}
```

## Triggering Examples

```swift
final class Foobar {
    let ↓badSubject = PassthroughSubject<Bool, Never>()
}
```

```swift
final class Foobar {
    let ↓badSubject: PassthroughSubject<Bool, Never>
}
```

```swift
final class Foobar {
    private(set) let ↓badSubject: PassthroughSubject<Bool, Never>
}
```

```swift
final class Foobar {
    private(set) let ↓badSubject = PassthroughSubject<Bool, Never>()
}
```

```swift
final class Foobar {
    let goodSubject: PassthroughSubject<Bool, Never> = .init()
}
```

```swift
final class Foobar {
    private let goodSubject: PassthroughSubject<Bool, Never>
    private(set) let ↓badSubject = PassthroughSubject<Bool, Never>()
    private(set) let ↓anotherBadSubject = PassthroughSubject<Bool, Never>()
}
```

```swift
final class Foobar {
    private(set) let ↓badSubject = PassthroughSubject<Bool, Never>()
    private let goodSubject: PassthroughSubject<Bool, Never>
    private(set) let ↓anotherBadSubject = PassthroughSubject<Bool, Never>()
}
```

```swift
final class Foobar {
    let ↓badSubject = CurrentValueSubject<Bool, Never>(true)
}
```

```swift
final class Foobar {
    let ↓badSubject: CurrentValueSubject<Bool, Never>
}
```

```swift
final class Foobar {
    private(set) let ↓badSubject: CurrentValueSubject<Bool, Never>
}
```

```swift
final class Foobar {
    private(set) let ↓badSubject = CurrentValueSubject<Bool, Never>(false)
}
```

```swift
final class Foobar {
    let goodSubject: CurrentValueSubject<String, Never> = .init("toto")
}
```

```swift
final class Foobar {
    private let goodSubject: CurrentValueSubject<Bool, Never>
    private(set) let ↓badSubject = CurrentValueSubject<Bool, Never>(false)
    private(set) let ↓anotherBadSubject = CurrentValueSubject<Bool, Never>(false)
}
```

```swift
final class Foobar {
    private(set) let ↓badSubject = CurrentValueSubject<Bool, Never>(false)
    private let goodSubject: CurrentValueSubject<Bool, Never>
    private(set) let ↓anotherBadSubject = CurrentValueSubject<Bool, Never>(true)
}
```

```swift
final class Foobar {
    let ↓badSubject = PassthroughSubject<Set<String>, Never>()
}
```

```swift
final class Foobar {
    let ↓badSubject: PassthroughSubject<Set<String>, Never> = .init()
}
```

```swift
final class Foobar {
    let ↓badSubject: CurrentValueSubject<Set<String>, Never> = .init([])
}
```

```swift
final class Foobar {
    let ↓badSubject =
        PassthroughSubject<Bool, Never>()
}
```

```swift
final class Foobar {
    let ↓badSubject:
        PassthroughSubject<Bool, Never> = .init()
}
```

```swift
final class Foobar {
    let ↓badSubject =
        CurrentValueSubject<Bool, Never>(true)
}
```