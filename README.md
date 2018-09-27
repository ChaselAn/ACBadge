# ACBadge
Swift3.0/4.0版本的右上角未读红点

<img width="250" height="445" src="https://raw.githubusercontent.com/ChaselAn/ACBadge/master/ACBadge.png"/>


## 安装

### CocoaPods  

* swift 3版本：  

```ruby
pod 'ACBadge', '~> 1.3.0'
```

* swift 4版本：

```ruby
pod 'ACBadge', '~> 1.4.0'
```

- swift 4.2版本：

```ruby
pod 'ACBadge', '~> 1.4.1'
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

### 为UIBarButtonItem添加红点（1.4.0版本暂时去掉此功能）
```swift
let leftItem = UIBarButtonItem(image: #imageLiteral(resourceName: "user01"), style: .plain, target: self, action: #selector(barButtonClicked))
navigationItem.leftBarButtonItem = leftItem
leftItem.ac_badgeRedDotWidth = 8
leftItem.ac_badgeCenterOffset = CGPoint(x: -8, y: 0)
leftItem.ac_showRedDot(true)
leftItem.ac_clearBadge() // 清除红点
```