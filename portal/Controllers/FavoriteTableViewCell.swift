//
//  FavoriteTableViewCell.swift
//  portal
//
//  Created by 藤田和磨 on 2018/11/19.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var institutionView: UIStackView!
    
    @IBOutlet weak var institutionImageView: UIImageView!
    
    @IBOutlet weak var institutionNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
