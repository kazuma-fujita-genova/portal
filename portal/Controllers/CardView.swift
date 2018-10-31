//
//  CardView.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/30.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit

class CardView: UIStackView {

    @IBOutlet weak var qrCodeImageView: UIImageView!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    class func instance() -> CardView {
        return UINib(nibName: "CardView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! CardView
    }
}
