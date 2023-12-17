# Capture Variable

Non-constant variables should not be listed in a closure's capture list to avoid confusion about closures capturing variables at creation time

* **Identifier:** capture_variable
* **Enabled by default:** No
* **Supports autocorrection:** No
* **Kind:** lint
* **Analyzer rule:** Yes
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
class C {
    let i: Int
    init(_ i: Int) { self.i = i }
}

let j: Int = 0
let c = C(1)

let closure: () -> Void = { [j, c] in
    print(c.i, j)
}

closure()
```

```swift
let iGlobal: Int = 0

class C {
    class var iClass: Int { 0 }
    static let iStatic: Int = 0
    let iInstance: Int = 0

    func callTest() {
        var iLocal: Int = 0
        test { [unowned self, iGlobal, iInstance, iLocal, iClass=C.iClass, iStatic=C.iStatic] j in
            print(iGlobal, iClass, iStatic, iInstance, iLocal, j)
        }
    }

    func test(_ completionHandler: @escaping (Int) -> Void) {
    }
}
```

```swift
var j: Int!
j = 0

let closure: () -> Void = { [j] in
    print(j)
}

closure()
j = 1
closure()
```

```swift
lazy var j: Int = { 0 }()

let closure: () -> Void = { [j] in
    print(j)
}

closure()
j = 1
closure()
```

## Triggering Examples

```swift
var j: Int = 0

let closure: () -> Void = { [j] in
    print(j)
}

closure()
j = 1
closure()
```

```swift
class C {
    let i: Int
    init(_ i: Int) { self.i = i }
}

var c = C(0)
let closure: () -> Void = { [c] in
    print(c.i)
}

closure()
c = C(1)
closure()
```

```swift
var iGlobal: Int = 0

class C {
    func callTest() {
        test { [iGlobal] j in
            print(iGlobal, j)
        }
    }

    func test(_ completionHandler: @escaping (Int) -> Void) {
    }
}
```

```swift
class C {
    static var iStatic: Int = 0

    static func callTest() {
        test { [↓iStatic] j in
            print(iStatic, j)
        }
    }

    static func test(_ completionHandler: @escaping (Int) -> Void) {
        completionHandler(2)
        C.iStatic = 1
        completionHandler(3)
    }
}

C.callTest()
```

```swift
class C {
    var iInstance: Int = 0

    func callTest() {
        test { [iInstance] j in
            print(iInstance, j)
        }
    }

    func test(_ completionHandler: @escaping (Int) -> Void) {
    }
}
```