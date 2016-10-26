//
//  ViewController.swift
//  GWProgressHUD
//
//  Created by 魏郭文 on 2016/10/10.
//  Copyright © 2016年 魏郭文. All rights reserved.
//

import UIKit

enum GWHUDAnimationType {
    case GWHUDTypeCircle, GWHUDTypeDot
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GWProgressHUD.show()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

