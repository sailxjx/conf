# for..in with increment

```swift
0.stride(to: 100, by: 10).forEach { i in
    print(i)
}
```

# `**` operator as `pow`

```swift
import Darwin

infix operator ** {}

func **(base: Double, power: Double) -> Double {
    return pow(base, power)
}

print(2 ** 3)
```

# `guard` && `defer`

<http://nshipster.com/guard-and-defer/>

# Set 操作
```
let array1 = ["a", "b", "c"]
let array2 = ["a", "b", "d"]

let set1 = Set(array1)
let set2 = Set(array2)

set1.union(array2)       // {"a", "b", "c", "d"}
set1.intersect(array2)   // {"a", "b"}
set1.subtract(array2)    // {"c"}
set1.exclusiveOr(array2) // {"c", "d"}
```
