//
//  UITabBarItem+ACBadge.swift
//  ACBadgeDemo
//
//  Created by ac on 2017/5/7.
//  Copyright © 2017年 ac. All rights reserved.
//

import UIKit

extension UITabBarItem {
  
  static let ac_imgViewTag = 1003
  
  // ⚠️ get以下属性时，必须保证UITabBarItem是有图片的，否则会崩！
  public var ac_badgeBackgroundColor: UIColor {
    set {
      ac_getBadgeSuperView?.ac_badgeBackgroundColor = newValue
    }
    get {
      return ac_getBadgeSuperView!.ac_badgeBackgroundColor
    }
  }
  
  public var ac_badgeTextColor: UIColor {
    set {
      ac_getBadgeSuperView?.ac_badgeTextColor = newValue
    }
    get {
      return ac_getBadgeSuperView!.ac_badgeTextColor
      
    }
  }
  
  public var ac_badgeRedDotWidth: CGFloat {
    set {
      ac_getBadgeSuperView?.ac_badgeRedDotWidth = newValue
    }
    get {
      return ac_getBadgeSuperView!.ac_badgeRedDotWidth
    }
  }
  
  public var ac_badge: UILabel? {
    set {
      ac_getBadgeSuperView?.ac_badge = newValue
    }
    get {
      return ac_getBadgeSuperView!.ac_badge
    }
  }
  
  public var ac_badgeCenterOffset: CGPoint {
    set {
      ac_getBadgeSuperView?.ac_badgeCenterOffset = newValue
    }
    get {
      return ac_getBadgeSuperView!.ac_badgeCenterOffset
    }
  }
  
  public var ac_badgeFont: UIFont {
    set {
      ac_getBadgeSuperView?.ac_badgeFont = newValue
    }
    get {
      return ac_getBadgeSuperView!.ac_badgeFont
    }
  }
  
  // badge的最大值，如果超过最大值，显示“最大值+”，比如最大值为99，超过99，显示“99+”，默认为0（没有最大值）
  public var ac_badgeMaximumNumber: Int {
    set {
      ac_getBadgeSuperView?.ac_badgeMaximumNumber = newValue
    }
    get {
      return ac_getBadgeSuperView!.ac_badgeMaximumNumber
    }
  }
  
  // 仅适用于type为number的bagde
  public var ac_badgeText: Int {
    set {
      ac_getBadgeSuperView?.ac_badgeText = newValue
    }
    get {
      return ac_getBadgeSuperView!.ac_badgeText
    }
  }
  
  public func ac_showBadge(with type: ACBadge.ACBadgeType) {
    ac_getBadgeSuperView?.ac_showBadge(with: type)
  }
  
  public func ac_clearBadge() {
    ac_getBadgeSuperView?.ac_clearBadge()
  }
  
  public func ac_resumeBadge() {
    ac_getBadgeSuperView?.ac_resumeBadge()
  }
  
  public func ac_showRedDot(_ isShow: Bool) {
    ac_getBadgeSuperView?.ac_showRedDot(isShow)
  }
  
  private var ac_getBadgeSuperView: UIView? {
    let bottomView = value(forKeyPath: "view")
    var actualSuperView: UIView? = nil
    if let bottomView = bottomView as? UIView {
      actualSuperView = findSubview(from: bottomView, where: NSClassFromString("UITabBarSwappableImageView")!)
    }
    actualSuperView?.tag = UITabBarItem.ac_imgViewTag
    return actualSuperView
  }
  
  private func findSubview(from view: UIView, where viewClass: AnyClass) -> UIView? {
    for subView in view.subviews {
      if subView .isKind(of: viewClass) {
        return subView
      }
    }
    return nil
  }
}

