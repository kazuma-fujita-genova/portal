//
//  KeywordSearchTableViewCell.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/31.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialCards

class KeywordSearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardView: MDCCard!
    
    @IBOutlet weak var cardHeight: NSLayoutConstraint!
    
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var institutionImageView: UIImageView!
    
    @IBOutlet weak var institutionNameLabel: UILabel!

    @IBOutlet weak var institutionAddressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupLabels()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupLabels() {
        // 以下はIBで設定
        // institutionAddressLabel.textColor = UIColor.gray
        // institutionAddressLabel.font = UIFont.systemFont(ofSize: 10)
        // institutionAddressLabel.numberOfLines = 0
        // institutionAddressLabel.lineBreakMode = NSLineBreakMode.byCharWrapping
        institutionAddressLabel.sizeToFit()
    }
    
}
