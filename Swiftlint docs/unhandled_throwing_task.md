# Unhandled Throwing Task

Errors thrown inside this task are not handled, which may be unexpected. Handle errors inside the task, or use `try await` to access the Tasks value and handle errors. See this forum thread for more details: https://forums.swift.org/t/task-initializer-with-throwing-closure-swallows-error/56066

* **Identifier:** unhandled_throwing_task
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
  error
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
Task<Void, Never> {
  try await myThrowingFunction()
}
```

```swift
Task {
  try? await myThrowingFunction()
}
```

```swift
Task {
  try! await myThrowingFunction()
}
```

```swift
Task<Void, String> {
  let text = try myThrowingFunction()
  return text
}
```

```swift
Task {
  do {
    try myThrowingFunction()
  } catch let e {
    print(e)
  }
}
```

```swift
func someFunction() throws {
  Task {
    anotherFunction()
    do {
      try myThrowingFunction()
    } catch {
      print(error)
    }
  }

  try something()
}
```

```swift
let task = Task {
  try await myThrowingFunction()
}
```

```swift
var task = Task {
  try await myThrowingFunction()
}
```

```swift
try await Task {
  try await myThrowingFunction()
}.value
```

```swift
executor.task = Task {
  try await isolatedOpen(.init(executor.asUnownedSerialExecutor()))
}
```

```swift
let result = await Task {
  throw CancellationError()
}.result
```

```swift
func makeTask() -> Task<String, Error> {
  return Task {
    try await someThrowingFunction()
  }
}
```

```swift
func makeTask() -> Task<String, Error> {
  // Implicit return
  Task {
    try await someThrowingFunction()
  }
}
```

```swift
Task {
  return Result {
      try someThrowingFunc()
  }
}
```

## Triggering Examples

```swift
↓Task {
  try await myThrowingFunction()
}
```

```swift
↓Task {
  let text = try myThrowingFunction()
  return text
}
```

```swift
↓Task {
  do {
    try myThrowingFunction()
  }
}
```

```swift
↓Task {
  do {
    try myThrowingFunction()
  } catch let e as FooError {
    print(e)
  }
}
```

```swift
↓Task {
  do {
    throw FooError.bar
  }
}
```

```swift
↓Task {
  throw FooError.bar
}
```

```swift
↓Task<_, _> {
  throw FooError.bar
}
```

```swift
↓Task<Void,_> {
  throw FooError.bar
}
```

```swift
↓Task {
  do {
    try foo()
  } catch {
    try bar()
  }
}
```

```swift
↓Task {
  do {
    try foo()
  } catch {
    throw BarError()
  }
}
```

```swift
func doTask() {
  ↓Task {
    try await someThrowingFunction()
  }
}
```