# Closure Body Length

Closure bodies should not span too many lines

* **Identifier:** closure_body_length
* **Enabled by default:** No
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
  warning
  </td>
  <td>
  30
  </td>
  </tr>
  <tr>
  <td>
  error
  </td>
  <td>
  100
  </td>
  </tr>
  </tbody>
  </table>

## Non Triggering Examples

```swift
foo.bar { $0 }
```

```swift
foo.bar { toto in
}
```

```swift
foo.bar { toto in
	let a0 = 0
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
```

```swift
foo.bar { toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
	let a21 = 0
	let a22 = 0
	let a23 = 0
	let a24 = 0
	let a25 = 0
	let a26 = 0
	let a27 = 0
	let a28 = 0
}
```

```swift
foo.bar { toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
	let a21 = 0
	let a22 = 0
	let a23 = 0
	let a24 = 0
	let a25 = 0
	let a26 = 0
	let a27 = 0
	let a28 = 0
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
```

```swift
foo.bar({ toto in
})
```

```swift
foo.bar({ toto in
	let a0 = 0
})
```

```swift
foo.bar({ toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
	let a21 = 0
	let a22 = 0
	let a23 = 0
	let a24 = 0
	let a25 = 0
	let a26 = 0
	let a27 = 0
	let a28 = 0
})
```

```swift
foo.bar(label: { toto in
})
```

```swift
foo.bar(label: { toto in
	let a0 = 0
})
```

```swift
foo.bar(label: { toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
	let a21 = 0
	let a22 = 0
	let a23 = 0
	let a24 = 0
	let a25 = 0
	let a26 = 0
	let a27 = 0
	let a28 = 0
})
```

```swift
foo.bar(label: { toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
	let a21 = 0
	let a22 = 0
	let a23 = 0
	let a24 = 0
	let a25 = 0
	let a26 = 0
	let a27 = 0
	let a28 = 0
}, anotherLabel: { toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
	let a21 = 0
	let a22 = 0
	let a23 = 0
	let a24 = 0
	let a25 = 0
	let a26 = 0
	let a27 = 0
	let a28 = 0
})
```

```swift
foo.bar(label: { toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
	let a21 = 0
	let a22 = 0
	let a23 = 0
	let a24 = 0
	let a25 = 0
	let a26 = 0
	let a27 = 0
	let a28 = 0
}) { toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
	let a21 = 0
	let a22 = 0
	let a23 = 0
	let a24 = 0
	let a25 = 0
	let a26 = 0
	let a27 = 0
	let a28 = 0
}
```

```swift
let foo: Bar = { toto in
	let bar = Bar()
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
	let a21 = 0
	let a22 = 0
	let a23 = 0
	let a24 = 0
	let a25 = 0
	let a26 = 0
	let a27 = 0
	return bar
}()
```

## Triggering Examples

```swift
foo.bar ↓{ toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
	let a21 = 0
	let a22 = 0
	let a23 = 0
	let a24 = 0
	let a25 = 0
	let a26 = 0
	let a27 = 0
	let a28 = 0
	let a29 = 0
	let a30 = 0
}
```

```swift
foo.bar ↓{ toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
	let a21 = 0
	let a22 = 0
	let a23 = 0
	let a24 = 0
	let a25 = 0
	let a26 = 0
	let a27 = 0
	let a28 = 0
	let a29 = 0
	let a30 = 0
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	// toto
	
	
	
	
	
	
	
	
	
	
}
```

```swift
foo.bar(↓{ toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
	let a21 = 0
	let a22 = 0
	let a23 = 0
	let a24 = 0
	let a25 = 0
	let a26 = 0
	let a27 = 0
	let a28 = 0
	let a29 = 0
	let a30 = 0
})
```

```swift
foo.bar(label: ↓{ toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
	let a21 = 0
	let a22 = 0
	let a23 = 0
	let a24 = 0
	let a25 = 0
	let a26 = 0
	let a27 = 0
	let a28 = 0
	let a29 = 0
	let a30 = 0
})
```

```swift
foo.bar(label: ↓{ toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
	let a21 = 0
	let a22 = 0
	let a23 = 0
	let a24 = 0
	let a25 = 0
	let a26 = 0
	let a27 = 0
	let a28 = 0
	let a29 = 0
	let a30 = 0
}, anotherLabel: ↓{ toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
	let a21 = 0
	let a22 = 0
	let a23 = 0
	let a24 = 0
	let a25 = 0
	let a26 = 0
	let a27 = 0
	let a28 = 0
	let a29 = 0
	let a30 = 0
})
```

```swift
foo.bar(label: ↓{ toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
	let a21 = 0
	let a22 = 0
	let a23 = 0
	let a24 = 0
	let a25 = 0
	let a26 = 0
	let a27 = 0
	let a28 = 0
	let a29 = 0
	let a30 = 0
}) ↓{ toto in
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
	let a21 = 0
	let a22 = 0
	let a23 = 0
	let a24 = 0
	let a25 = 0
	let a26 = 0
	let a27 = 0
	let a28 = 0
	let a29 = 0
	let a30 = 0
}
```

```swift
let foo: Bar = ↓{ toto in
	let bar = Bar()
	let a0 = 0
	let a1 = 0
	let a2 = 0
	let a3 = 0
	let a4 = 0
	let a5 = 0
	let a6 = 0
	let a7 = 0
	let a8 = 0
	let a9 = 0
	let a10 = 0
	let a11 = 0
	let a12 = 0
	let a13 = 0
	let a14 = 0
	let a15 = 0
	let a16 = 0
	let a17 = 0
	let a18 = 0
	let a19 = 0
	let a20 = 0
	let a21 = 0
	let a22 = 0
	let a23 = 0
	let a24 = 0
	let a25 = 0
	let a26 = 0
	let a27 = 0
	let a28 = 0
	return bar
}()
```