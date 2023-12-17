# Accessibility Label for Image

Images that provide context should have an accessibility label or should be explicitly hidden from accessibility

* **Identifier:** accessibility_label_for_image
* **Enabled by default:** No
* **Supports autocorrection:** No
* **Kind:** lint
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.1.0
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
struct MyView: View {
    var body: some View {
        Image(decorative: "my-image")
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Image("my-image", label: Text("Alt text for my image"))
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Image("my-image")
            .accessibility(hidden: true)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Image("my-image")
            .accessibilityHidden(true)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Image("my-image")
            .accessibility(label: Text("Alt text for my image"))
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Image("my-image")
            .accessibilityLabel(Text("Alt text for my image"))
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Image(uiImage: myUiImage)
            .renderingMode(.template)
            .foregroundColor(.blue)
            .accessibilityHidden(true)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Image(uiImage: myUiImage)
            .accessibilityLabel(Text("Alt text for my image"))
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        SwiftUI.Image(uiImage: "my-image").resizable().accessibilityHidden(true)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        VStack {
            Image(decorative: "my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
            Image("my-image")
                .accessibility(label: Text("Alt text for my image"))
        }
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        VStack {
            Image("my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
            Image("my-image")
                .accessibility(label: Text("Alt text for my image"))
        }.accessibilityElement()
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        VStack {
            Image("my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
            Image("my-image")
                .accessibility(label: Text("Alt text for my image"))
        }.accessibilityHidden(true)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        HStack(spacing: 8) {
            Image(decorative: "my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
            Text("Text to accompany my image")
        }.accessibilityElement(children: .combine)
        .padding(16)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        HStack(spacing: 8) {
            Image("my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
            Text("Text to accompany my image")
        }.accessibilityElement(children: .ignore)
        .padding(16)
        .accessibilityLabel(Text("Label for my image and text"))
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Button(action: { doAction() }) {
            Image("my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
        }
        .accessibilityLabel(Text("Label for my image"))
    }
}
```

## Triggering Examples

```swift
struct MyView: View {
    var body: some View {
        ↓Image("my-image")
            .resizable(true)
            .frame(width: 48, height: 48)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        ↓Image(uiImage: myUiImage)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        ↓SwiftUI.Image(uiImage: "my-image").resizable().accessibilityHidden(false)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Image(uiImage: myUiImage)
            .resizable()
            .frame(width: 48, height: 48)
            .accessibilityLabel(Text("Alt text for my image"))
        ↓Image("other image")
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Image(decorative: "image1")
        ↓Image("image2")
        Image(uiImage: "image3")
            .accessibility(label: Text("a pretty picture"))
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        VStack {
            Image(decorative: "my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
            ↓Image("my-image")
        }
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        VStack {
            ↓Image("my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
            Image("my-image")
                .accessibility(label: Text("Alt text for my image"))
        }.accessibilityElement(children: .contain)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        VStack {
            ↓Image("my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
            Image("my-image")
                .accessibility(label: Text("Alt text for my image"))
        }.accessibilityHidden(false)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        HStack(spacing: 8) {
            ↓Image("my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
            Text("Text to accompany my image")
        }.accessibilityElement(children: .combine)
        .padding(16)
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        Button(action: { doAction() }) {
            ↓Image("my-image")
                .renderingMode(.template)
                .foregroundColor(.blue)
        }
    }
}
```

```swift
struct MyView: View {
    var body: some View {
        ↓Image(systemName: "circle.plus")
    }
}
```