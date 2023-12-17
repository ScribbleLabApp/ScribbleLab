# Unneeded Synthesized Initializer

Default or memberwise initializers that will be automatically synthesized do not need to be manually defined.

* **Identifier:** unneeded_synthesized_initializer
* **Enabled by default:** Yes
* **Supports autocorrection:** Yes
* **Kind:** idiomatic
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
struct Foo {
    let bar: String

    // Synthesized initializer would not be private.
    private init(bar: String) {
        self.bar = bar
    }
}
```

```swift
struct Foo {
    var bar: String

    // Synthesized initializer would not be private.
    private init(bar: String) {
        self.bar = bar
    }
}
```

```swift
struct Foo {
    let bar: String

    // Synthesized initializer would not be fileprivate.
    fileprivate init(bar: String) {
        self.bar = bar
    }
}
```

```swift
struct Foo {
    let bar: String

    // Synthesized initializer would not prepend "foo".
    init(bar: String) {
        self.bar = "foo" + bar
    }
}
```

```swift
internal struct Foo {
    let bar: String

    // Failable initializer
    init?(bar: String) {
        self.bar = bar
    }
}
```

```swift
internal struct Foo {
    let bar: String

    // Initializer throws
    init(bar: String) throws {
        self.bar = bar
    }
}
```

```swift
internal struct Foo {
    let bar: String

    // Different argument labels
    init(_ bar: String) {
        self.bar = bar
    }
}
```

```swift
internal struct Foo {
    var bar: String = "foo"

    // Different default values
    init(bar: String = "bar") {
        self.bar = bar
    }
}
```

```swift
internal struct Foo {
    private static var bar: String

    // var is static
    init(bar: String) {
        Self.bar = bar
    }
}
```

```swift
internal struct Foo {
    private var bar: String

    // var is private
    init(bar: String) {
        self.bar = bar
    }
}
```

```swift
internal struct Foo {
    fileprivate var bar: String

    // var is fileprivate
    init(bar: String) {
        self.bar = bar
    }
}
```

```swift
struct Foo {
    var foo: String
    var bar: String

    // init has no body
    init(foo: String, bar: String) {
    }
}
```

```swift
struct Foo {
    var foo: String
    var bar: String

    // foo is not initialized
    init(foo: String, bar: String) {
        self.bar = bar
    }
}
```

```swift
struct Foo {
    var foo: String
    var bar: String

    // Ordering of args is different from properties.
    init(bar: String, foo: String) {
        self.foo = foo
        self.bar = bar
    }
}
```

```swift
@frozen
public struct Field {
    @usableFromInline
    let index: Int

    @usableFromInline
    let parent: Metadata

    @inlinable // inlinable
    init(index: Int, parent: Metadata) {
       self.index = index
       self.parent = parent
    }
}
```

```swift
internal struct Foo {
    var bar: String = ""
    var baz: Int = 0

    // These initializers must be declared.
    init() { }

    init(bar: String = "", baz: Int = 0) {
        self.bar = bar
        self.baz = baz
    }

    // Because manually declared initializers block
    // synthesization.
    init(bar: String) {
        self.bar = bar
    }
}
```

```swift
struct Foo {
    init() {
        print("perform side effect")
    }
}
```

```swift
struct Foo {
    var bar: Int = 0

    init(bar: Int = 0) {
        self.bar = bar
        print("perform side effect")
    }
}
```

## Triggering Examples

```swift
struct Foo {
    let bar: String

   ↓init(bar: String) {
        self.bar = bar
    }
}
```

```swift
struct Foo {
    var bar: String

   ↓init(bar: String) {
        self.bar = bar
    }
}
```

```swift
private struct Foo {
    let bar: String

   ↓init(bar: String) {
        self.bar = bar
    }
}
```

```swift
fileprivate struct Foo {
    let bar: String

   ↓init(bar: String) {
        self.bar = bar
    }
}
```

```swift
internal struct Foo {
    fileprivate var bar: String

   ↓fileprivate init(bar: String) {
        self.bar = bar
    }
}
```

```swift
internal struct Foo {
    private var bar: String

   ↓private init(bar: String) {
        self.bar = bar
    }
}
```

```swift
struct Foo {
    var foo: String
    var bar: String

   ↓init(foo: String, bar: String) {
        self.foo = foo
        self.bar = bar
    }
}
```

```swift
internal struct Foo {
    var bar: String

   ↓internal init(bar: String) {
        self.bar = bar
    }
}
```

```swift
struct Foo {
    var bar: String = ""

   ↓init() {
        // Empty initializer will be generated automatically
        // when all vars have default values.
    }
}
```

```swift
struct Foo {
    var bar: String = ""

   ↓init() {
        // Empty initializer
    }

   ↓init(bar: String = "") {
        self.bar = bar
    }
}
```

```swift
struct Foo {
    var bar = ""

   ↓init(bar: String = "") {
        self.bar = bar
    }
}
```

```swift
struct Outer {
    struct Inner {
        let prop: Int

       ↓init(prop: Int) {
            self.prop = prop
        }
    }
}
```

```swift
class Foo {
    struct Bar {
        let baz: Int

       ↓init(baz: Int) {
            self.baz = baz
        }
    }
}
```