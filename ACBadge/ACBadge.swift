//
//  ACBadge.swift
//  ACBadgeDemo
//
//  Created by ancheng on 2017/3/27.
//  Copyright © 2017年 ac. All rights reserved.
//

import UIKit

public class ACBadge: NSObject {
  
  public enum ACBadgeType {
    case redDot
    case number(with: Int)
  }
  
  public static let shared = ACBadge()
  
  // 设置全局默认属性
  public var defaultBadgeBackgroundColor = UIColor.red
  public var defaultBadgeTextColor = UIColor.white
  public var defaultBadgeRedDotWidth: CGFloat = 8
  public var defaultBadgeDefaultFont: UIFont = UIFont.systemFont(ofSize: 9)
  public var defaultBadgeMaximumNumber = 0
}
