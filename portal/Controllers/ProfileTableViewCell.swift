//
//  ProfileTableViewCell.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/24.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //cellView.layer.borderWidth = CGFloat(0.5)
        //cellView.layer.borderColor = UIColor.gray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
