# Private SwiftUI State Properties

SwiftUI state properties should be private

* **Identifier:** private_swiftui_state
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
struct MyApp: App {
    @State private var isPlaying: Bool = false
}
```

```swift
struct MyScene: Scene {
    @State private var isPlaying: Bool = false
}
```

```swift
struct ContentView: View {
    @State private var isPlaying: Bool = false
}
```

```swift
struct ContentView: View {
    @State fileprivate var isPlaying: Bool = false
}
```

```swift
struct ContentView: View {
    @State private var isPlaying: Bool = false

    struct InnerView: View {
        @State private var showsIndicator: Bool = false
    }
}
```

```swift
struct MyStruct {
    struct ContentView: View {
        @State private var isPlaying: Bool = false
    }
}
```

```swift
struct MyStruct {
    struct ContentView: View {
        @State private var isPlaying: Bool = false
    }

    @State var nonTriggeringState: Bool = false
}
```

```swift
struct ContentView: View {
    var isPlaying = false
}
```

```swift
struct MyApp: App {
    @StateObject private var model = DataModel()
}
```

```swift
struct MyScene: Scene {
    @StateObject private var model = DataModel()
}
```

```swift
struct ContentView: View {
    @StateObject private var model = DataModel()
}
```

```swift
struct MyStruct {
    struct ContentView: View {
        @StateObject private var dataModel = DataModel()
    }

    @StateObject var nonTriggeringObject = MyModel()
}
```

```swift
struct Foo {
    @State var bar = false
}
```

```swift
class Foo: ObservableObject {
    @State var bar = Bar()
}
```

```swift
extension MyObject {
    struct ContentView: View {
        @State private var isPlaying: Bool = false
    }
}
```

```swift
actor ContentView: View {
    @State private var isPlaying: Bool = false
}
```

## Triggering Examples

```swift
struct MyApp: App {
    @State ↓var isPlaying: Bool = false
}
```

```swift
struct MyScene: Scene {
    @State ↓var isPlaying: Bool = false
}
```

```swift
struct ContentView: View {
    @State ↓var isPlaying: Bool = false
}
```

```swift
struct ContentView: View {
    struct InnerView: View {
        @State private var showsIndicator: Bool = false
    }

    @State ↓var isPlaying: Bool = false
}
```

```swift
struct MyStruct {
    struct ContentView: View {
        @State ↓var isPlaying: Bool = false
    }
}
```

```swift
struct MyStruct {
    struct ContentView: View {
        @State ↓var isPlaying: Bool = false
    }

    @State var isPlaying: Bool = false
}
```

```swift
final class ContentView: View {
    @State ↓var isPlaying: Bool = false
}
```

```swift
extension MyObject {
    struct ContentView: View {
        @State ↓var isPlaying: Bool = false
    }
}
```

```swift
actor ContentView: View {
    @State ↓var isPlaying: Bool = false
}
```

```swift
struct MyApp: App {
    @StateObject ↓var model = DataModel()
}
```

```swift
struct MyScene: Scene {
    @StateObject ↓var model = DataModel()
}
```

```swift
struct ContentView: View {
    @StateObject ↓var model = DataModel()
}
```