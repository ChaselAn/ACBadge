//
//  ViewController.swift
//  ACBadgeDemo
//
//  Created by ac on 2017/3/26.
//  Copyright © 2017年 ac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var autoLayoutView1: UIView!
  @IBOutlet weak var autoLayoutView2: UIView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    ACBadge.shared.defaultBadgeRedDotWidth = 20
    let redDotView = UIView(frame: CGRect(x: 100, y: 100, width: 50, height: 30))
    redDotView.backgroundColor = UIColor.blue
    redDotView.ac_showBadge(with: .redDot)
    redDotView.ac_badgeText = 123123123
    view.addSubview(redDotView)
    
    let numView = UIView(frame: CGRect(x: 100, y: 200, width: 50, height: 30))
    numView.backgroundColor = UIColor.yellow
    numView.ac_badgeFont = UIFont.systemFont(ofSize: 14)
    numView.ac_showBadge(with: .number(with: 999))
    view.addSubview(numView)
    
    autoLayoutView1.ac_badgeRedDotWidth = 20
    autoLayoutView1.ac_badgeBackgroundColor = UIColor.yellow
    autoLayoutView1.ac_badgeCenterOffset = CGPoint(x: 10, y: 10)
    autoLayoutView1.ac_showBadge(with: .redDot)
    
    autoLayoutView2.ac_badgeFont = UIFont.systemFont(ofSize: 14)
    autoLayoutView2.ac_badgeMaximumNumber = 19
    autoLayoutView2.ac_badgeTextColor = UIColor.black
    autoLayoutView2.ac_showBadge(with: .number(with: 20))
    
    
    let firstItem = tabBarController?.tabBar.items?.first
    firstItem?.ac_showBadge(with: .redDot)
    let lastItem = tabBarController?.tabBar.items?.last
    lastItem?.ac_showBadge(with: .number(with: 20))
  }

}
