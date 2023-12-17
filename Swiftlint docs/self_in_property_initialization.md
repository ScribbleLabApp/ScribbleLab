# Self in Property Initialization

`self` refers to the unapplied `NSObject.self()` method, which is likely not expected; make the variable `lazy` to be able to refer to the current instance or use `ClassName.self`

* **Identifier:** self_in_property_initialization
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
  </tbody>
  </table>

## Non Triggering Examples

```swift
class View: UIView {
    let button: UIButton = {
        return UIButton()
    }()
}
```

```swift
class View: UIView {
    lazy var button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
}
```

```swift
class View: UIView {
    var button: UIButton = {
        let button = UIButton()
        button.addTarget(otherObject, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
}
```

```swift
class View: UIView {
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.registerReusable(Cell.self)

        return collectionView
    }()
}
```

## Triggering Examples

```swift
class View: UIView {
    ↓var button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
}
```

```swift
class View: UIView {
    ↓let button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
}
```