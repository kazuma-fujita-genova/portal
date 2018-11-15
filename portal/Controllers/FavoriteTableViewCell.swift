//
//  FavoriteTableViewCell.swift
//  portal
//
//  Created by 藤田和磨 on 2018/11/06.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit
import FoldingCell

class FavoriteTableViewCell: FoldingCell {

    @IBOutlet weak var forgroundViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var foregroundImageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var foregroundImageView: UIImageView!
    
    @IBOutlet weak var containerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var containerInstitutionViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var containerImageViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var containerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = UIColor.clear
        foregroundView.layer.cornerRadius = 5
        foregroundView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 5
        containerView.layer.masksToBounds = true
        
        /* TODO Shadowを付ける
        foregroundView.layer.shadowColor = UIColor.black.cgColor
        foregroundView.layer.shadowOpacity = 0.5 // 透明度
        foregroundView.layer.shadowOffset = CGSize(width: 5, height: 5) // 距離
        foregroundView.layer.shadowRadius = 5 // ぼかし量
         */
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func animationDuration(_ itemIndex:NSInteger, type:AnimationType)-> TimeInterval {
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }
    
}
