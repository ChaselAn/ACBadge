//
//  ACView+extension.swift
//  ACBadgeDemo
//
//  Created by ac on 2017/3/26.
//  Copyright © 2017年 ac. All rights reserved.
//

import UIKit

extension UIView {

  private static var ac_badgeBackgroundColorKey: Character!
  private static var ac_badgeTextColorKey: Character!
  private static var ac_badgeKey: Character!
  private static var ac_badgeRedDotWidthKey: Character!
  private static var ac_badgeCenterOffsetKey: Character!
  private static var ac_badgeFontKey: Character!
  private static var ac_badgeMaximumNumberKey: Character!
  private static var ac_badgeTextKey: Character!
  
  var ac_badgeBackgroundColor: UIColor {
    set {
      objc_setAssociatedObject(self, &UIView.ac_badgeBackgroundColorKey, newValue, .OBJC_ASSOCIATION_RETAIN)
      if let badge = ac_badge {
        badge.backgroundColor = newValue
      }
    }
    get {
      return (objc_getAssociatedObject(self, &UIView.ac_badgeBackgroundColorKey) as? UIColor) ?? ACBadge.shared.defaultBadgeBackgroundColor
    }
  }
  
  var ac_badgeTextColor: UIColor {
    set {
      objc_setAssociatedObject(self, &UIView.ac_badgeTextColorKey, newValue, .OBJC_ASSOCIATION_RETAIN)
      if let badge = ac_badge {
        badge.textColor = newValue
      }
    }
    get {
      return (objc_getAssociatedObject(self, &UIView.ac_badgeTextColorKey) as? UIColor) ?? ACBadge.shared.defaultBadgeTextColor
    }
  }
  
  var ac_badgeRedDotWidth: CGFloat {
    set {
      objc_setAssociatedObject(self, &UIView.ac_badgeRedDotWidthKey, newValue, .OBJC_ASSOCIATION_RETAIN)
    }
    get {
      return (objc_getAssociatedObject(self, &UIView.ac_badgeRedDotWidthKey) as? CGFloat) ?? ACBadge.shared.defaultBadgeRedDotWidth
    }
  }
  
  var ac_badge: UILabel? {
    set {
      objc_setAssociatedObject(self, &UIView.ac_badgeKey, newValue, .OBJC_ASSOCIATION_RETAIN)
    }
    get {
      return objc_getAssociatedObject(self, &UIView.ac_badgeKey) as? UILabel
    }
  }
  
  var ac_badgeCenterOffset: CGPoint {
    set {
      objc_setAssociatedObject(self, &UIView.ac_badgeCenterOffsetKey, newValue, .OBJC_ASSOCIATION_RETAIN)
      if let badge = ac_badge {
        badge.center = CGPoint(x: frame.width + newValue.x, y: newValue.y)
      }
    }
    get {
      return (objc_getAssociatedObject(self, &UIView.ac_badgeCenterOffsetKey) as? CGPoint) ?? CGPoint.zero
    }
  }
  
  var ac_badgeFont: UIFont {
    set {
      objc_setAssociatedObject(self, &UIView.ac_badgeFontKey, newValue, .OBJC_ASSOCIATION_RETAIN)
      if let badge = ac_badge {
        badge.font = newValue
      }
    }
    get {
      return (objc_getAssociatedObject(self, &UIView.ac_badgeFontKey) as? UIFont) ?? ACBadge.shared.defaultBadgeDefaultFont
    }
  }
  
  // badge的最大值，如果超过最大值，显示“最大值+”，比如最大值为99，超过99，显示“99+”，默认为0（没有最大值）
  var ac_badgeMaximumNumber: Int {
    set {
      objc_setAssociatedObject(self, &UIView.ac_badgeMaximumNumberKey, newValue, .OBJC_ASSOCIATION_RETAIN)
    }
    get {
      return (objc_getAssociatedObject(self, &UIView.ac_badgeMaximumNumberKey) as? Int) ?? ACBadge.shared.defaultBadgeMaximumNumber
    }
  }
  
  // 仅适用于type为number的bagde
  var ac_badgeText: Int {
    set {
      objc_setAssociatedObject(self, &UIView.ac_badgeTextKey, newValue, .OBJC_ASSOCIATION_RETAIN)
      if ac_badge != nil && ac_badge!.tag == UIView.numberTag {
        ac_showBadge(with: .number(with: newValue))
      }
    }
    get {
      return (objc_getAssociatedObject(self, &UIView.ac_badgeTextKey) as? Int) ?? 0
    }
  }
}

extension UIView {
  
  private static let redDotTag = 0
  fileprivate static let numberTag = 1000
  
  func ac_showBadge(with type: ACBadge.ACBadgeType) {
    switch type {
    case .redDot:
      ac_showRedDotBadge()
    case .number(with: let num):
      ac_showNumberBadge(with: num)
    }
  }
  
  func ac_clearBadge() {
    ac_badge?.isHidden = true
  }
  
  // 让之前clear过的badge重新出现，badge的值为clear之前的值
  func ac_resumeBadge() {
    if let badge = ac_badge, badge.isHidden == true {
      badge.isHidden = false
    }
  }
  
  private func ac_showRedDotBadge() {
    ac_initBadgeView()
    ac_badge?.text = ""
  }
  
  private func ac_showNumberBadge(with num: Int) {
    if num < 0 { return }
    ac_initBadgeView()
    ac_badge?.tag = UIView.numberTag
    ac_badge?.isHidden = (num == 0)
    ac_badge?.font = ac_badgeFont
    if ac_badgeMaximumNumber > 0 {
      ac_badge?.text = num > ac_badgeMaximumNumber ? "\(ac_badgeMaximumNumber)+" : "\(num)"
    } else {
       ac_badge?.text = "\(num)"
    }
    let att = NSMutableAttributedString(string: ac_badge?.text ?? "")
    att.addAttributes([NSFontAttributeName: ac_badge!.font], range: NSRange(location: 0, length: (ac_badge?.text ?? "").characters.count))
    ac_badge?.frame = att.boundingRect(with: CGSize.zero, options: [.usesLineFragmentOrigin,.usesFontLeading], context: nil)
    ac_badge?.frame.size.width += 4
    ac_badge?.frame.size.height += 4
    ac_badge?.center = CGPoint(x: frame.width + ac_badgeCenterOffset.x, y: ac_badgeCenterOffset.y)
    ac_badge?.layer.cornerRadius = ac_badge!.frame.height / 2
    
  }
  
  private func ac_initBadgeView() {
    if ac_badge == nil {
      ac_badge = UILabel(frame: CGRect(x: frame.width, y: -ac_badgeRedDotWidth, width: ac_badgeRedDotWidth, height: ac_badgeRedDotWidth))
      ac_badge!.textAlignment = .center
      ac_badge!.center = CGPoint(x: frame.width + ac_badgeCenterOffset.x, y: ac_badgeCenterOffset.y)
      ac_badge!.backgroundColor = ac_badgeBackgroundColor
      ac_badge!.textColor = ac_badgeTextColor
      ac_badge!.tag = UIView.redDotTag
      layoutIfNeeded()
      ac_badge!.layer.cornerRadius = ac_badge!.frame.width / 2
      ac_badge!.layer.masksToBounds = true
      addSubview(ac_badge!)
      bringSubview(toFront: ac_badge!)
    }
  }

}
