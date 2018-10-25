//
//  FavoriteTableViewCell.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/25.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialButtons_ButtonThemer
import MaterialComponents.MaterialCards_CardThemer

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var card: MDCCard!
    
    //@IBOutlet weak var cardImageView: CardImageView!
    @IBOutlet weak var cardImageView: CardImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var button: MDCButton!
    
    var colorScheme = MDCSemanticColorScheme()
    var shapeScheme = MDCShapeScheme()
    var typographyScheme = MDCTypographyScheme()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //let bundle = Bundle(for: FavoriteViewController.self)
        //bundle.loadNibNamed("FavoriteViewController", owner: self, options: nil)
        //self.view.frame = self.view.bounds
        
        // self.contentView.autoresizingMask = autoresizingMask
        /*
        let buttonScheme = MDCButtonScheme();
        buttonScheme.colorScheme = colorScheme
        buttonScheme.typographyScheme = typographyScheme
        MDCTextButtonThemer.applyScheme(buttonScheme, to: button)
        */
        let cardScheme = MDCCardScheme();
        cardScheme.colorScheme = colorScheme
        cardScheme.shapeScheme = shapeScheme
        MDCCardThemer.applyScheme(cardScheme, to: card)
        card.isInteractable = false
        
        cardImageView.isAccessibilityElement = true
        cardImageView.accessibilityLabel = "Missing Dish"

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

class CardImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.curveImageToCorners()
    }
    
    func curveImageToCorners() {
        if let card = self.superview as? MDCCard,
            let shapedShadowLayer = card.layer as? MDCShapedShadowLayer {
            self.layer.mask = shapedShadowLayer.shapeLayer
        }
    }
}
