//
//  InstitutionViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/18.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit
import Hero

class InstitutionViewController: UIViewController {

    @IBOutlet weak var institutionImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hero.isEnabled = true
        institutionImageView.hero.id = "institutionImageView"
        nameLabel.hero.id = "nameLabel"
        institutionImageView.isUserInteractionEnabled = true
        institutionImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCancelButton(gestureRecognizer:))))
        // nameLabel.hero.modifiers = [.translate(y: 500), .useGlobalCoordinateSpace]
    }
    
    @objc func handleCancelButton(gestureRecognizer: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}
