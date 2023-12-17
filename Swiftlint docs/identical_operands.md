# Identical Operands

Comparing two identical operands is likely a mistake

* **Identifier:** identical_operands
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
1 == 2
```

```swift
foo == bar
```

```swift
prefixedFoo == foo
```

```swift
foo.aProperty == foo.anotherProperty
```

```swift
self.aProperty == self.anotherProperty
```

```swift
"1 == 1"
```

```swift
self.aProperty == aProperty
```

```swift
lhs.aProperty == rhs.aProperty
```

```swift
lhs.identifier == rhs.identifier
```

```swift
i == index
```

```swift
$0 == 0
```

```swift
keyValues?.count ?? 0 == 0
```

```swift
string == string.lowercased()
```

```swift
let num: Int? = 0
_ = num != nil && num == num?.byteSwapped
```

```swift
num == num!.byteSwapped
```

```swift
1    + 1 ==   1     +    2
```

```swift
f(  i :   2) ==   f (i: 3 )
```

```swift
1 != 2
```

```swift
foo != bar
```

```swift
prefixedFoo != foo
```

```swift
foo.aProperty != foo.anotherProperty
```

```swift
self.aProperty != self.anotherProperty
```

```swift
"1 != 1"
```

```swift
self.aProperty != aProperty
```

```swift
lhs.aProperty != rhs.aProperty
```

```swift
lhs.identifier != rhs.identifier
```

```swift
i != index
```

```swift
$0 != 0
```

```swift
keyValues?.count ?? 0 != 0
```

```swift
string != string.lowercased()
```

```swift
let num: Int? = 0
_ = num != nil && num != num?.byteSwapped
```

```swift
num != num!.byteSwapped
```

```swift
1    + 1 !=   1     +    2
```

```swift
f(  i :   2) !=   f (i: 3 )
```

```swift
1 === 2
```

```swift
foo === bar
```

```swift
prefixedFoo === foo
```

```swift
foo.aProperty === foo.anotherProperty
```

```swift
self.aProperty === self.anotherProperty
```

```swift
"1 === 1"
```

```swift
self.aProperty === aProperty
```

```swift
lhs.aProperty === rhs.aProperty
```

```swift
lhs.identifier === rhs.identifier
```

```swift
i === index
```

```swift
$0 === 0
```

```swift
keyValues?.count ?? 0 === 0
```

```swift
string === string.lowercased()
```

```swift
let num: Int? = 0
_ = num != nil && num === num?.byteSwapped
```

```swift
num === num!.byteSwapped
```

```swift
1    + 1 ===   1     +    2
```

```swift
f(  i :   2) ===   f (i: 3 )
```

```swift
1 !== 2
```

```swift
foo !== bar
```

```swift
prefixedFoo !== foo
```

```swift
foo.aProperty !== foo.anotherProperty
```

```swift
self.aProperty !== self.anotherProperty
```

```swift
"1 !== 1"
```

```swift
self.aProperty !== aProperty
```

```swift
lhs.aProperty !== rhs.aProperty
```

```swift
lhs.identifier !== rhs.identifier
```

```swift
i !== index
```

```swift
$0 !== 0
```

```swift
keyValues?.count ?? 0 !== 0
```

```swift
string !== string.lowercased()
```

```swift
let num: Int? = 0
_ = num != nil && num !== num?.byteSwapped
```

```swift
num !== num!.byteSwapped
```

```swift
1    + 1 !==   1     +    2
```

```swift
f(  i :   2) !==   f (i: 3 )
```

```swift
1 > 2
```

```swift
foo > bar
```

```swift
prefixedFoo > foo
```

```swift
foo.aProperty > foo.anotherProperty
```

```swift
self.aProperty > self.anotherProperty
```

```swift
"1 > 1"
```

```swift
self.aProperty > aProperty
```

```swift
lhs.aProperty > rhs.aProperty
```

```swift
lhs.identifier > rhs.identifier
```

```swift
i > index
```

```swift
$0 > 0
```

```swift
keyValues?.count ?? 0 > 0
```

```swift
string > string.lowercased()
```

```swift
let num: Int? = 0
_ = num != nil && num > num?.byteSwapped
```

```swift
num > num!.byteSwapped
```

```swift
1    + 1 >   1     +    2
```

```swift
f(  i :   2) >   f (i: 3 )
```

```swift
1 >= 2
```

```swift
foo >= bar
```

```swift
prefixedFoo >= foo
```

```swift
foo.aProperty >= foo.anotherProperty
```

```swift
self.aProperty >= self.anotherProperty
```

```swift
"1 >= 1"
```

```swift
self.aProperty >= aProperty
```

```swift
lhs.aProperty >= rhs.aProperty
```

```swift
lhs.identifier >= rhs.identifier
```

```swift
i >= index
```

```swift
$0 >= 0
```

```swift
keyValues?.count ?? 0 >= 0
```

```swift
string >= string.lowercased()
```

```swift
let num: Int? = 0
_ = num != nil && num >= num?.byteSwapped
```

```swift
num >= num!.byteSwapped
```

```swift
1    + 1 >=   1     +    2
```

```swift
f(  i :   2) >=   f (i: 3 )
```

```swift
1 < 2
```

```swift
foo < bar
```

```swift
prefixedFoo < foo
```

```swift
foo.aProperty < foo.anotherProperty
```

```swift
self.aProperty < self.anotherProperty
```

```swift
"1 < 1"
```

```swift
self.aProperty < aProperty
```

```swift
lhs.aProperty < rhs.aProperty
```

```swift
lhs.identifier < rhs.identifier
```

```swift
i < index
```

```swift
$0 < 0
```

```swift
keyValues?.count ?? 0 < 0
```

```swift
string < string.lowercased()
```

```swift
let num: Int? = 0
_ = num != nil && num < num?.byteSwapped
```

```swift
num < num!.byteSwapped
```

```swift
1    + 1 <   1     +    2
```

```swift
f(  i :   2) <   f (i: 3 )
```

```swift
1 <= 2
```

```swift
foo <= bar
```

```swift
prefixedFoo <= foo
```

```swift
foo.aProperty <= foo.anotherProperty
```

```swift
self.aProperty <= self.anotherProperty
```

```swift
"1 <= 1"
```

```swift
self.aProperty <= aProperty
```

```swift
lhs.aProperty <= rhs.aProperty
```

```swift
lhs.identifier <= rhs.identifier
```

```swift
i <= index
```

```swift
$0 <= 0
```

```swift
keyValues?.count ?? 0 <= 0
```

```swift
string <= string.lowercased()
```

```swift
let num: Int? = 0
_ = num != nil && num <= num?.byteSwapped
```

```swift
num <= num!.byteSwapped
```

```swift
1    + 1 <=   1     +    2
```

```swift
f(  i :   2) <=   f (i: 3 )
```

```swift
func evaluate(_ mode: CommandMode) -> Result<Options, CommandantError<CommandantError<()>>>
```

```swift
let array = Array<Array<Int>>()
```

```swift
guard Set(identifiers).count != identifiers.count else { return }
```

```swift
expect("foo") == "foo"
```

```swift
type(of: model).cachePrefix == cachePrefix
```

```swift
histogram[156].0 == 0x003B8D96 && histogram[156].1 == 1
```

```swift
[Wrapper(type: .three), Wrapper(type: .one)].sorted { "\($0.type)" > "\($1.type)"}
```

```swift
array.sorted { "\($0)" < "\($1)" }
```

## Triggering Examples

```swift
↓1 == 1
```

```swift
↓foo == foo
```

```swift
↓foo.aProperty == foo.aProperty
```

```swift
↓self.aProperty == self.aProperty
```

```swift
↓$0 == $0
```

```swift
↓a?.b == a?.b
```

```swift
if (↓elem == elem) {}
```

```swift
XCTAssertTrue(↓s3 == s3)
```

```swift
if let tab = tabManager.selectedTab, ↓tab.webView == tab.webView
```

```swift
↓1    + 1 ==   1     +    1
```

```swift
 ↓f(  i :   2) ==   f (i: 
 2 )
```

```swift
↓1 != 1
```

```swift
↓foo != foo
```

```swift
↓foo.aProperty != foo.aProperty
```

```swift
↓self.aProperty != self.aProperty
```

```swift
↓$0 != $0
```

```swift
↓a?.b != a?.b
```

```swift
if (↓elem != elem) {}
```

```swift
XCTAssertTrue(↓s3 != s3)
```

```swift
if let tab = tabManager.selectedTab, ↓tab.webView != tab.webView
```

```swift
↓1    + 1 !=   1     +    1
```

```swift
 ↓f(  i :   2) !=   f (i: 
 2 )
```

```swift
↓1 === 1
```

```swift
↓foo === foo
```

```swift
↓foo.aProperty === foo.aProperty
```

```swift
↓self.aProperty === self.aProperty
```

```swift
↓$0 === $0
```

```swift
↓a?.b === a?.b
```

```swift
if (↓elem === elem) {}
```

```swift
XCTAssertTrue(↓s3 === s3)
```

```swift
if let tab = tabManager.selectedTab, ↓tab.webView === tab.webView
```

```swift
↓1    + 1 ===   1     +    1
```

```swift
 ↓f(  i :   2) ===   f (i: 
 2 )
```

```swift
↓1 !== 1
```

```swift
↓foo !== foo
```

```swift
↓foo.aProperty !== foo.aProperty
```

```swift
↓self.aProperty !== self.aProperty
```

```swift
↓$0 !== $0
```

```swift
↓a?.b !== a?.b
```

```swift
if (↓elem !== elem) {}
```

```swift
XCTAssertTrue(↓s3 !== s3)
```

```swift
if let tab = tabManager.selectedTab, ↓tab.webView !== tab.webView
```

```swift
↓1    + 1 !==   1     +    1
```

```swift
 ↓f(  i :   2) !==   f (i: 
 2 )
```

```swift
↓1 > 1
```

```swift
↓foo > foo
```

```swift
↓foo.aProperty > foo.aProperty
```

```swift
↓self.aProperty > self.aProperty
```

```swift
↓$0 > $0
```

```swift
↓a?.b > a?.b
```

```swift
if (↓elem > elem) {}
```

```swift
XCTAssertTrue(↓s3 > s3)
```

```swift
if let tab = tabManager.selectedTab, ↓tab.webView > tab.webView
```

```swift
↓1    + 1 >   1     +    1
```

```swift
 ↓f(  i :   2) >   f (i: 
 2 )
```

```swift
↓1 >= 1
```

```swift
↓foo >= foo
```

```swift
↓foo.aProperty >= foo.aProperty
```

```swift
↓self.aProperty >= self.aProperty
```

```swift
↓$0 >= $0
```

```swift
↓a?.b >= a?.b
```

```swift
if (↓elem >= elem) {}
```

```swift
XCTAssertTrue(↓s3 >= s3)
```

```swift
if let tab = tabManager.selectedTab, ↓tab.webView >= tab.webView
```

```swift
↓1    + 1 >=   1     +    1
```

```swift
 ↓f(  i :   2) >=   f (i: 
 2 )
```

```swift
↓1 < 1
```

```swift
↓foo < foo
```

```swift
↓foo.aProperty < foo.aProperty
```

```swift
↓self.aProperty < self.aProperty
```

```swift
↓$0 < $0
```

```swift
↓a?.b < a?.b
```

```swift
if (↓elem < elem) {}
```

```swift
XCTAssertTrue(↓s3 < s3)
```

```swift
if let tab = tabManager.selectedTab, ↓tab.webView < tab.webView
```

```swift
↓1    + 1 <   1     +    1
```

```swift
 ↓f(  i :   2) <   f (i: 
 2 )
```

```swift
↓1 <= 1
```

```swift
↓foo <= foo
```

```swift
↓foo.aProperty <= foo.aProperty
```

```swift
↓self.aProperty <= self.aProperty
```

```swift
↓$0 <= $0
```

```swift
↓a?.b <= a?.b
```

```swift
if (↓elem <= elem) {}
```

```swift
XCTAssertTrue(↓s3 <= s3)
```

```swift
if let tab = tabManager.selectedTab, ↓tab.webView <= tab.webView
```

```swift
↓1    + 1 <=   1     +    1
```

```swift
 ↓f(  i :   2) <=   f (i: 
 2 )
```

```swift
    return ↓lhs.foo == lhs.foo &&
           lhs.bar == rhs.bar
```

```swift
    return lhs.foo == rhs.foo &&
           ↓lhs.bar == lhs.bar
```