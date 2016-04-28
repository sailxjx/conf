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
