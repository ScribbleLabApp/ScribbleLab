# Nesting

Types should be nested at most 1 level deep, and functions should be nested at most 2 levels deep.

* **Identifier:** nesting
* **Enabled by default:** Yes
* **Supports autocorrection:** No
* **Kind:** metrics
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
  type_level
  </td>
  <td>
  <table>
  <thead>
  <tr><th>Key</th><th>Value</th></tr>
  </thead>
  <tbody>
  <tr>
  <td>
  warning
  </td>
  <td>
  1
  </td>
  </tr>
  </tbody>
  </table>
  </td>
  </tr>
  <tr>
  <td>
  function_level
  </td>
  <td>
  <table>
  <thead>
  <tr><th>Key</th><th>Value</th></tr>
  </thead>
  <tbody>
  <tr>
  <td>
  warning
  </td>
  <td>
  2
  </td>
  </tr>
  </tbody>
  </table>
  </td>
  </tr>
  <tr>
  <td>
  check_nesting_in_closures_and_statements
  </td>
  <td>
  true
  </td>
  </tr>
  <tr>
  <td>
  always_allow_one_type_in_functions
  </td>
  <td>
  false
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
    class Example_0 {
        class Example_1 {}
    }
```

```swift
    var example: Int {
        class Example_0 {
            class Example_1 {}
        }
        return 5
    }
```

```swift
    var example: Int = 5 {
        didSet {
            class Example_0 {
                class Example_1 {}
            }
        }
    }
```

```swift
    extension Example_0 {
        class Example_1 {}
    }
```

```swift
    struct Example_0 {
        struct Example_1 {}
    }
```

```swift
    var example: Int {
        struct Example_0 {
            struct Example_1 {}
        }
        return 5
    }
```

```swift
    var example: Int = 5 {
        didSet {
            struct Example_0 {
                struct Example_1 {}
            }
        }
    }
```

```swift
    extension Example_0 {
        struct Example_1 {}
    }
```

```swift
    enum Example_0 {
        enum Example_1 {}
    }
```

```swift
    var example: Int {
        enum Example_0 {
            enum Example_1 {}
        }
        return 5
    }
```

```swift
    var example: Int = 5 {
        didSet {
            enum Example_0 {
                enum Example_1 {}
            }
        }
    }
```

```swift
    extension Example_0 {
        enum Example_1 {}
    }
```

```swift
    func f_0() {
        func f_1() {
            func f_2() {}
        }
    }
```

```swift
    var example: Int {
        func f_0() {
            func f_1() {
                func f_2() {}
            }
        }
        return 5
    }
```

```swift
    var example: Int = 5 {
        didSet {
            func f_0() {
                func f_1() {
                    func f_2() {}
                }
            }
        }
    }
```

```swift
    extension Example_0 {
        func f_0() {
            func f_1() {
                func f_2() {}
            }
        }
    }
```

```swift
    switch example {
    case .exampleCase:
        class Example_0 {
            class Example_1 {}
        }
    default:
        func f_0() {
            func f_1() {
                func f_2() {}
            }
        }
    }
```

```swift
    var exampleClosure: () -> Void = {
        class Example_0 {
            class Example_1 {}
        }
        func f_0() {
            func f_1() {
                func f_2() {}
            }
        }
    }
```

```swift
    exampleFunc(closure: {
        class Example_0 {
            class Example_1 {}
        }
        func f_0() {
            func f_1() {
                func f_2() {}
            }
        }
    })
```

```swift
    switch example {
    case .exampleCase:
        struct Example_0 {
            struct Example_1 {}
        }
    default:
        func f_0() {
            func f_1() {
                func f_2() {}
            }
        }
    }
```

```swift
    var exampleClosure: () -> Void = {
        struct Example_0 {
            struct Example_1 {}
        }
        func f_0() {
            func f_1() {
                func f_2() {}
            }
        }
    }
```

```swift
    exampleFunc(closure: {
        struct Example_0 {
            struct Example_1 {}
        }
        func f_0() {
            func f_1() {
                func f_2() {}
            }
        }
    })
```

```swift
    switch example {
    case .exampleCase:
        enum Example_0 {
            enum Example_1 {}
        }
    default:
        func f_0() {
            func f_1() {
                func f_2() {}
            }
        }
    }
```

```swift
    var exampleClosure: () -> Void = {
        enum Example_0 {
            enum Example_1 {}
        }
        func f_0() {
            func f_1() {
                func f_2() {}
            }
        }
    }
```

```swift
    exampleFunc(closure: {
        enum Example_0 {
            enum Example_1 {}
        }
        func f_0() {
            func f_1() {
                func f_2() {}
            }
        }
    })
```

```swift
    class Example_0 {
        func f_0() {
            class Example_1 {
                func f_1() {
                    func f_2() {}
                }
            }
        }
    }
```

```swift
    class Example_0 {
        func f_0() {
            switch example {
            case .exampleCase:
                class Example_1 {
                    func f_1() {
                        func f_2() {}
                    }
                }
            default:
                exampleFunc(closure: {
                    class Example_1 {
                        func f_1() {
                            func f_2() {}
                        }
                    }
                })
            }
        }
    }
```

```swift
    struct Example_0 {
        func f_0() {
            struct Example_1 {
                func f_1() {
                    func f_2() {}
                }
            }
        }
    }
```

```swift
    struct Example_0 {
        func f_0() {
            switch example {
            case .exampleCase:
                struct Example_1 {
                    func f_1() {
                        func f_2() {}
                    }
                }
            default:
                exampleFunc(closure: {
                    struct Example_1 {
                        func f_1() {
                            func f_2() {}
                        }
                    }
                })
            }
        }
    }
```

```swift
    enum Example_0 {
        func f_0() {
            enum Example_1 {
                func f_1() {
                    func f_2() {}
                }
            }
        }
    }
```

```swift
    enum Example_0 {
        func f_0() {
            switch example {
            case .exampleCase:
                enum Example_1 {
                    func f_1() {
                        func f_2() {}
                    }
                }
            default:
                exampleFunc(closure: {
                    enum Example_1 {
                        func f_1() {
                            func f_2() {}
                        }
                    }
                })
            }
        }
    }
```

## Triggering Examples

```swift
    class Example_0 {
        class Example_1 {
            ↓class Example_2 {}
        }
    }
```

```swift
    var example: Int {
        class Example_0 {
            class Example_1 {
                ↓class Example_2 {}
            }
        }
        return 5
    }
```

```swift
    var example: Int = 5 {
        didSet {
            class Example_0 {
                class Example_1 {
                    ↓class Example_2 {}
                }
            }
        }
    }
```

```swift
    extension Example_0 {
        class Example_1 {
            ↓class Example_2 {}
        }
    }
```

```swift
    struct Example_0 {
        struct Example_1 {
            ↓struct Example_2 {}
        }
    }
```

```swift
    var example: Int {
        struct Example_0 {
            struct Example_1 {
                ↓struct Example_2 {}
            }
        }
        return 5
    }
```

```swift
    var example: Int = 5 {
        didSet {
            struct Example_0 {
                struct Example_1 {
                    ↓struct Example_2 {}
                }
            }
        }
    }
```

```swift
    extension Example_0 {
        struct Example_1 {
            ↓struct Example_2 {}
        }
    }
```

```swift
    enum Example_0 {
        enum Example_1 {
            ↓enum Example_2 {}
        }
    }
```

```swift
    var example: Int {
        enum Example_0 {
            enum Example_1 {
                ↓enum Example_2 {}
            }
        }
        return 5
    }
```

```swift
    var example: Int = 5 {
        didSet {
            enum Example_0 {
                enum Example_1 {
                    ↓enum Example_2 {}
                }
            }
        }
    }
```

```swift
    extension Example_0 {
        enum Example_1 {
            ↓enum Example_2 {}
        }
    }
```

```swift
    func f_0() {
        func f_1() {
            func f_2() {
                ↓func f_3() {}
            }
        }
    }
```

```swift
    var example: Int {
        func f_0() {
            func f_1() {
                func f_2() {
                    ↓func f_3() {}
                }
            }
        }
        return 5
    }
```

```swift
    var example: Int = 5 {
        didSet {
            func f_0() {
                func f_1() {
                    func f_2() {
                        ↓func f_3() {}
                    }
                }
            }
        }
    }
```

```swift
    extension Example_0 {
        func f_0() {
            func f_1() {
                func f_2() {
                    ↓func f_3() {}
                }
            }
        }
    }
```

```swift
    switch example {
    case .exampleCase:
        class Example_0 {
            class Example_1 {
                ↓class Example_2 {}
            }
        }
    default:
        func f_0() {
            func f_1() {
                func f_2() {
                    ↓func f_3() {}
                }
            }
        }
    }
```

```swift
    var exampleClosure: () -> Void = {
        class Example_0 {
            class Example_1 {
                ↓class Example_2 {}
            }
            }
        func f_0() {
            func f_1() {
                func f_2() {
                    ↓func f_3() {}
                }
            }
        }
    }
```

```swift
    exampleFunc(closure: {
        class Example_0 {
            class Example_1 {}
        }
        func f_0() {
            func f_1() {
                func f_2() {
                    ↓func f_3() {}
                }
            }
        }
    })
```

```swift
    switch example {
    case .exampleCase:
        struct Example_0 {
            struct Example_1 {
                ↓struct Example_2 {}
            }
        }
    default:
        func f_0() {
            func f_1() {
                func f_2() {
                    ↓func f_3() {}
                }
            }
        }
    }
```

```swift
    var exampleClosure: () -> Void = {
        struct Example_0 {
            struct Example_1 {
                ↓struct Example_2 {}
            }
            }
        func f_0() {
            func f_1() {
                func f_2() {
                    ↓func f_3() {}
                }
            }
        }
    }
```

```swift
    exampleFunc(closure: {
        struct Example_0 {
            struct Example_1 {}
        }
        func f_0() {
            func f_1() {
                func f_2() {
                    ↓func f_3() {}
                }
            }
        }
    })
```

```swift
    switch example {
    case .exampleCase:
        enum Example_0 {
            enum Example_1 {
                ↓enum Example_2 {}
            }
        }
    default:
        func f_0() {
            func f_1() {
                func f_2() {
                    ↓func f_3() {}
                }
            }
        }
    }
```

```swift
    var exampleClosure: () -> Void = {
        enum Example_0 {
            enum Example_1 {
                ↓enum Example_2 {}
            }
            }
        func f_0() {
            func f_1() {
                func f_2() {
                    ↓func f_3() {}
                }
            }
        }
    }
```

```swift
    exampleFunc(closure: {
        enum Example_0 {
            enum Example_1 {}
        }
        func f_0() {
            func f_1() {
                func f_2() {
                    ↓func f_3() {}
                }
            }
        }
    })
```

```swift
    class Example_0 {
        func f_0() {
            class Example_1 {
                func f_1() {
                    func f_2() {
                        ↓class Example_2 {}
                        ↓func f_3() {}
                    }
                }
            }
        }
    }
```

```swift
    class Example_0 {
        func f_0() {
            switch example {
            case .exampleCase:
                class Example_1 {
                    func f_1() {
                        func f_2() {
                            ↓class Example_2 {}
                            ↓func f_3() {}
                        }
                    }
                }
            default:
                exampleFunc(closure: {
                    class Example_1 {
                        func f_1() {
                            func f_2() {
                                ↓class Example_2 {}
                                ↓func f_3() {}
                            }
                        }
                    }
                })
            }
        }
    }
```

```swift
    struct Example_0 {
        func f_0() {
            struct Example_1 {
                func f_1() {
                    func f_2() {
                        ↓struct Example_2 {}
                        ↓func f_3() {}
                    }
                }
            }
        }
    }
```

```swift
    struct Example_0 {
        func f_0() {
            switch example {
            case .exampleCase:
                struct Example_1 {
                    func f_1() {
                        func f_2() {
                            ↓struct Example_2 {}
                            ↓func f_3() {}
                        }
                    }
                }
            default:
                exampleFunc(closure: {
                    struct Example_1 {
                        func f_1() {
                            func f_2() {
                                ↓struct Example_2 {}
                                ↓func f_3() {}
                            }
                        }
                    }
                })
            }
        }
    }
```

```swift
    enum Example_0 {
        func f_0() {
            enum Example_1 {
                func f_1() {
                    func f_2() {
                        ↓enum Example_2 {}
                        ↓func f_3() {}
                    }
                }
            }
        }
    }
```

```swift
    enum Example_0 {
        func f_0() {
            switch example {
            case .exampleCase:
                enum Example_1 {
                    func f_1() {
                        func f_2() {
                            ↓enum Example_2 {}
                            ↓func f_3() {}
                        }
                    }
                }
            default:
                exampleFunc(closure: {
                    enum Example_1 {
                        func f_1() {
                            func f_2() {
                                ↓enum Example_2 {}
                                ↓func f_3() {}
                            }
                        }
                    }
                })
            }
        }
    }
```