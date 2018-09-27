////
////  UIBarButtonItem+ACBadge.swift
////  ACBadgeDemo
////
////  Created by ancheng on 2017/8/3.
////  Copyright © 2017年 ac. All rights reserved.
////
//
//import UIKit
//
//extension UIBarButtonItem {
//
//  static let ac_imgViewTag = 1003
//  
//  public var ac_badgeBackgroundColor: UIColor {
//    set {
//      ac_getBadgeSuperView?.ac_badgeBackgroundColor = newValue
//    }
//    get {
//      return ac_getBadgeSuperView!.ac_badgeBackgroundColor
//    }
//  }
//
//  public var ac_badgeTextColor: UIColor {
//    set {
//      ac_getBadgeSuperView?.ac_badgeTextColor = newValue
//    }
//    get {
//      return ac_getBadgeSuperView!.ac_badgeTextColor
//
//    }
//  }
//
//  public var ac_badgeRedDotWidth: CGFloat {
//    set {
//      ac_getBadgeSuperView?.ac_badgeRedDotWidth = newValue
//    }
//    get {
//      return ac_getBadgeSuperView!.ac_badgeRedDotWidth
//    }
//  }
//
//  public var ac_badge: UILabel? {
//    set {
//      ac_getBadgeSuperView?.ac_badge = newValue
//    }
//    get {
//      return ac_getBadgeSuperView!.ac_badge
//    }
//  }
//
//  public var ac_badgeCenterOffset: CGPoint {
//    set {
//      ac_getBadgeSuperView?.ac_badgeCenterOffset = newValue
//    }
//    get {
//      return ac_getBadgeSuperView!.ac_badgeCenterOffset
//    }
//  }
//
//  public var ac_badgeFont: UIFont {
//    set {
//      ac_getBadgeSuperView?.ac_badgeFont = newValue
//    }
//    get {
//      return ac_getBadgeSuperView!.ac_badgeFont
//    }
//  }
//
//  // badge的最大值，如果超过最大值，显示“最大值+”，比如最大值为99，超过99，显示“99+”，默认为0（没有最大值）
//  public var ac_badgeMaximumNumber: Int {
//    set {
//      ac_getBadgeSuperView?.ac_badgeMaximumNumber = newValue
//    }
//    get {
//      return ac_getBadgeSuperView!.ac_badgeMaximumNumber
//    }
//  }
//
//  // 仅适用于type为number的bagde
//  public var ac_badgeText: Int {
//    set {
//      ac_getBadgeSuperView?.ac_badgeText = newValue
//    }
//    get {
//      return ac_getBadgeSuperView!.ac_badgeText
//    }
//  }
//
//  public func ac_showBadge(with type: ACBadge.ACBadgeType) {
//    ac_getBadgeSuperView?.ac_showBadge(with: type)
//  }
//
//  public func ac_clearBadge() {
//    ac_getBadgeSuperView?.ac_clearBadge()
//  }
//
//  public func ac_resumeBadge() {
//    ac_getBadgeSuperView?.ac_resumeBadge()
//  }
//
//  public func ac_showRedDot(_ isShow: Bool) {
//    ac_getBadgeSuperView?.ac_showRedDot(isShow)
//  }
//
//  private var ac_getBadgeSuperView: UIView? {
//    let actualSuperView = value(forKeyPath: "view") as? UIView
//    actualSuperView?.tag = UITabBarItem.ac_imgViewTag
//    return actualSuperView
//  }
//}
//
