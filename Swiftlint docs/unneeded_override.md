# Unneeded Overridden Functions

Remove overridden functions that don't do anything except call their super

* **Identifier:** unneeded_override
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
class Foo {
    override func bar() {
        super.bar()
        print("hi")
    }
}
```

```swift
class Foo {
    @available(*, unavailable)
    override func bar() {
        super.bar()
    }
}
```

```swift
class Foo {
    override func bar() {
        super.bar()
        super.bar()
    }
}
```

```swift
class Foo {
    override func bar() throws {
        // Doing a different variation of 'try' changes behavior
        try! super.bar()
    }
}
```

```swift
class Foo {
    override func bar() throws {
        // Doing a different variation of 'try' changes behavior
        try? super.bar()
    }
}
```

```swift
class Foo {
    override func bar() async throws {
        // Doing a different variation of 'try' changes behavior
        await try! super.bar()
    }
}
```

```swift
class Foo {
    override func bar(arg: Bool) {
        // Flipping the argument changes behavior
        super.bar(arg: !arg)
    }
}
```

```swift
class Foo {
    override func bar(_ arg: Int) {
        // Changing the argument changes behavior
        super.bar(arg + 1)
    }
}
```

```swift
class Foo {
    override func bar(arg: Int) {
        // Changing the argument changes behavior
        super.bar(arg: arg.var)
    }
}
```

```swift
class Foo {
    override func bar(_ arg: Int) {
        // Not passing arguments because they have default values changes behavior
        super.bar()
    }
}
```

```swift
class Foo {
    override func bar(arg: Int, _ arg3: Bool) {
        // Calling a super function with different argument labels changes behavior
        super.bar(arg2: arg, arg3: arg3)
    }
}
```

```swift
class Foo {
    override func bar(animated: Bool, completion: () -> Void) {
        super.bar(animated: animated) {
            // This likely changes behavior
        }
    }
}
```

```swift
class Foo {
    override func bar(animated: Bool, completion: () -> Void) {
        super.bar(animated: animated, completion: {
            // This likely changes behavior
        })
    }
}
```

## Triggering Examples

```swift
class Foo {
    ↓override func bar() {
        super.bar()
    }
}
```

```swift
class Foo {
    ↓override func bar() {
        return super.bar()
    }
}
```

```swift
class Foo {
    ↓override func bar() {
        super.bar()
        // comments don't affect this
    }
}
```

```swift
class Foo {
    ↓override func bar() async {
        await super.bar()
    }
}
```

```swift
class Foo {
    ↓override func bar() throws {
        try super.bar()
        // comments don't affect this
    }
}
```

```swift
class Foo {
    ↓override func bar(arg: Bool) throws {
        try super.bar(arg: arg)
    }
}
```

```swift
class Foo {
    ↓override func bar(animated: Bool, completion: () -> Void) {
        super.bar(animated: animated, completion: completion)
    }
}
```