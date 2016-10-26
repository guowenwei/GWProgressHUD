//
//  GWProgressHUD.swift
//  GWProgressHUD
//
//  Created by 魏郭文 on 2016/10/10.
//  Copyright © 2016年 魏郭文. All rights reserved.
//

import UIKit

class GWProgressHUD: UIView {
    
    let mylayer = CALayer.init()
    let replicatorLayer = CAReplicatorLayer.init()
    let basicAnimation = CABasicAnimation.init()
    let defaultBackGroundColor = UIColor.init(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.2)
    let circleColor = UIColor.init(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.6)
    let count:CGFloat = 10
    override init(frame: CGRect) {
        super.init(frame: frame)
        let width:CGFloat = 10;
        self.mylayer.masksToBounds = true
        self.mylayer.frame = CGRect.init(x: 0, y: 0, width: width, height: width);
        self.mylayer.cornerRadius = width / 2;
        self.mylayer.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
        self.mylayer.backgroundColor = self.circleColor.cgColor;
        
        self.replicatorLayer.cornerRadius = 10
        self.replicatorLayer.instanceCount = 10;
        self.replicatorLayer.backgroundColor = self.defaultBackGroundColor.cgColor;
        let angle:CGFloat = CGFloat(2 * M_PI) / self.count;
        self.replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
        self.replicatorLayer.instanceDelay = 1.0 / Double(self.count);
        
        self.basicAnimation.repeatCount = MAXFLOAT;
        self.basicAnimation.keyPath = "transform.scale";
        self.basicAnimation.duration = 1;
        self.basicAnimation.fromValue = 1;
        self.basicAnimation.toValue = 0.1;
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.replicatorLayer.frame = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        self.replicatorLayer.position = self.center
        self.mylayer.position = CGPoint.init(x: 15, y: 50)
    }
    
    private func hide() -> Void {
        if self.superview != nil {
            self.removeFromSuperview()
        }
    }
    
    public static func hide()
    {
        let hud = GWProgressHUD.init(frame: CGRect.init())
        hud.hide()
    }
    
    private func show()
    {
        self.layer.addSublayer(self.replicatorLayer)
        self.replicatorLayer.addSublayer(self.mylayer)
        self.mylayer.add(self.basicAnimation, forKey: "scale")
    }
    
    public static func show()
    {
        let size = UIScreen.main.bounds.size
        let hud = GWProgressHUD.init(frame: CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        hud.show()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
