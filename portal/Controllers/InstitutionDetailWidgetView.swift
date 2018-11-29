//
//  InstitutionDetailWidgetView.swift
//  portal
//
//  Created by 藤田和磨 on 2018/11/27.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit

//@IBDesignable
class InstitutionDetailWidgetView: UIView {
    
    @IBOutlet weak var headingLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        // xibを登録。IBでFile's OwnerをXibViewにしたので ownerはself になる
        guard let widgetView = UINib(nibName: "InstitutionDetailWidgetView", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        widgetView.frame = self.bounds
        widgetView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(widgetView)

        // 下線部を引く
        // TODO:下線部がひけない。。
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0, y: self.frame.height, width: self.frame.width, height:1.0)
        bottomBorder.backgroundColor = UIColor.lightGray.cgColor
        //self.layer.addSublayer(bottomBorder)
        self.layer.addSublayer(bottomBorder)
        
    }
}
