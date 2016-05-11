```swift
let shadow = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))  // 初始化 view
shadow.frame.size.width = 10  // 设置宽度
shadow.backgroundColor = UIColor.clearColor()  // 清除背景色
shadow.layer.borderColor = UIColor.grayColor().CGColor  // 设置边框颜色
shadow.layer.borderWidth = 1.0  // 设置边框宽度

view.addSubview(shadow)  // 将 view 加到场景中
```

```
NSDate().timeIntervalSince1970  // 获取当前时间戳
```

Closure 语法 <http://fuckingswiftblocksyntax.com/>

```swift
let arr = [1,2,3]

arr.reduce(0, combine: { (x: Int, y: Int) -> Int in
  x + y
})

arr.reduce(0, combine: { x, y in
  x + y
})

arr.reduce(0) { x, y in
  x + y
}

arr.reduce(0) { $0 + $1 }
```
