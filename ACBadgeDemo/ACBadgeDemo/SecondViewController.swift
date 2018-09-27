//
//  SecondViewController.swift
//  ACBadgeDemo
//
//  Created by ac on 2017/3/26.
//  Copyright © 2017年 ac. All rights reserved.
//

import UIKit
import ACBadge

class SecondViewController: UIViewController {

  @IBOutlet weak var imgView: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imgView.ac_showBadge(with: .redDot)
  }
  

}
