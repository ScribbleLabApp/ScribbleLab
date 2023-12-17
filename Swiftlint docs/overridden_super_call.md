# Overridden Method Calls Super

Some overridden methods should always call super.

* **Identifier:** overridden_super_call
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
  <tr>
  <td>
  excluded
  </td>
  <td>
  []
  </td>
  </tr>
  <tr>
  <td>
  included
  </td>
  <td>
  [&quot;*&quot;]
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
class VC: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
```

```swift
class VC: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        self.method1()
        super.viewWillAppear(animated)
        self.method2()
    }
}
```

```swift
class VC: UIViewController {
    override func loadView() {
    }
}
```

```swift
class Some {
    func viewWillAppear(_ animated: Bool) {
    }
}
```

```swift
class VC: UIViewController {
    override func viewDidLoad() {
    defer {
        super.viewDidLoad()
        }
    }
}
```

## Triggering Examples

```swift
class VC: UIViewController {
    override func viewWillAppear(_ animated: Bool) {↓
        //Not calling to super
        self.method()
    }
}
```

```swift
class VC: UIViewController {
    override func viewWillAppear(_ animated: Bool) {↓
        super.viewWillAppear(animated)
        //Other code
        super.viewWillAppear(animated)
    }
}
```

```swift
class VC: UIViewController {
    override func didReceiveMemoryWarning() {↓
    }
}
```