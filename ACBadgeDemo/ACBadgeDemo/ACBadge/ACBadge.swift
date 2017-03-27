//
//  ACBadge.swift
//  ACBadgeDemo
//
//  Created by ancheng on 2017/3/27.
//  Copyright © 2017年 ac. All rights reserved.
//

import UIKit

class ACBadge: NSObject {
  
  enum ACBadgeType {
    case redDot
    case number(with: Int)
  }
  
  static let shared = ACBadge()
  
  // 设置全局默认属性
  var defaultBadgeBackgroundColor = UIColor.red
  var defaultBadgeTextColor = UIColor.white
  var defaultBadgeRedDotWidth: CGFloat = 8
  var defaultBadgeDefaultFont: UIFont = UIFont.systemFont(ofSize: 9)
  var defaultBadgeMaximumNumber = 0
}
