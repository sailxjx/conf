```swift
let shadow = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))  // 初始化 view
shadow.frame.size.width = 10  // 设置宽度
shadow.backgroundColor = UIColor.clearColor()  // 清除背景色
shadow.layer.borderColor = UIColor.grayColor().CGColor  // 设置边框颜色
shadow.layer.borderWidth = 1.0  // 设置边框宽度

view.addSubview(shadow)  // 将 view 加到场景中
```
