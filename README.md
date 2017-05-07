# ACBadge
Swift3.0版本的右上角未读红点

<div align=center><img width="150" height="266" src="http://7xte1z.com1.z0.glb.clouddn.com/ACBadge.png"/></div>


## 安装

### CocoaPods    

```ruby
pod 'ACBadge'
```

Then, run the following command:

```bash
$ pod install
```

## 使用
### 设置全局属性
```swift
ACBadge.default.redDotWidth = 20
ACBadge.default.backgroundColor = UIColor.red
ACBadge.default.textColor = UIColor.white
ACBadge.default.font = UIFont.systemFont(ofSize: 15)
ACBadge.default.maximumNumber = 99 // 数字红点的最大值，超过这个值，显示“这个值+”
```

### 为UIView添加红点
```swift
view.ac_showBadge(with: .redDot)
// 或者 view.ac_showRedDot(true)
view.ac_showBadge(with: .number(with: 999)) // number传0时消失
view.ac_clearBadge() // 清除红点
```

### 为UITabBarItem添加红点
```swift
let firstItem = tabBarController?.tabBar.items?.first
firstItem.ac_showBadge(with: .redDot)
// 或者 firstItem.ac_showRedDot(true)
firstItem.ac_showBadge(with: .number(with: 999)) // number传0时红点消失
firstItem.ac_clearBadge() // 清除红点
```