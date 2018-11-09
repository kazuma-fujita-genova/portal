//
//  RegistCardAccountSelectViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/11/09.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialButtons_ButtonThemer

class RegistCardAccountSelectViewController: UIViewController {

    @IBOutlet weak var cancelButton: MDCButton!
    
    @IBOutlet weak var myselfCardButton: MDCButton!
    
    @IBOutlet weak var familyCardButton: MDCButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "閉じる", style: .done, target: self, action: #selector(handleCancelButton(_:forEvent:)))
        buttonSetup()
    }
    
    private func buttonSetup() {
        let buttonScheme = MDCButtonScheme()
        MDCContainedButtonThemer.applyScheme(buttonScheme, to: myselfCardButton)
        myselfCardButton.addTarget(self, action: #selector(handleMyselfCardButton(_:forEvent:)), for: .touchUpInside)
        MDCContainedButtonThemer.applyScheme(buttonScheme, to: familyCardButton)
        familyCardButton.addTarget(self, action: #selector(handleFamilyCardButton(_:forEvent:)), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(handleCancelButton(_:forEvent:)), for: .touchUpInside)
    }
    
    @objc func handleMyselfCardButton (_ sender: UIButton, forEvent event: UIEvent) {
        let readQRCodeNavigationViewController = ReadQRCodeNavigationViewController(nibName: "ReadQRCodeNavigationViewController", bundle: nil)
        // Push遷移
        self.navigationController?.show(readQRCodeNavigationViewController, sender: nil)
    }
    
    @objc func handleFamilyCardButton (_ sender: UIButton, forEvent event: UIEvent) {
        // let registViewController = RegistViewController(nibName: "RegistViewController", bundle: nil)
        // Push遷移
        // self.navigationController?.show(registViewController, sender: nil)
    }
    
    @objc func handleCancelButton(_ sender: UIButton, forEvent event: UIEvent) {
        self.dismiss(animated: true, completion: nil)
    }
}
