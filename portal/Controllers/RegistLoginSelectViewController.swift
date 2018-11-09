//
//  RegistLoginSelectViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/11/06.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextFields
import MaterialComponents.MaterialButtons_ButtonThemer

class RegistLoginSelectViewController: UIViewController {

    @IBOutlet weak var privacyPolicyButton: MDCButton!
    
    @IBOutlet weak var termsButton: MDCButton!
    
    @IBOutlet weak var loginButton: MDCButton!
    
    @IBOutlet weak var registButton: MDCButton!
    
    @IBOutlet weak var cancelButton: MDCButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "閉じる", style: .done, target: self, action: #selector(handleCancelButton(_:forEvent:)))
        buttonSetup()
    }
    
    private func buttonSetup() {
        let buttonScheme = MDCButtonScheme()
        MDCContainedButtonThemer.applyScheme(buttonScheme, to: loginButton)
        loginButton.addTarget(self, action: #selector(handleLoginButton(_:forEvent:)), for: .touchUpInside)
        MDCContainedButtonThemer.applyScheme(buttonScheme, to: registButton)
        registButton.addTarget(self, action: #selector(handleRegistButton(_:forEvent:)), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(handleCancelButton(_:forEvent:)), for: .touchUpInside)
    }

    @objc func handleLoginButton (_ sender: UIButton, forEvent event: UIEvent) {
        let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        // Push遷移
        self.navigationController?.show(loginViewController, sender: nil)
    }

    @objc func handleRegistButton (_ sender: UIButton, forEvent event: UIEvent) {
        let registViewController = RegistViewController(nibName: "RegistViewController", bundle: nil)
        // Push遷移
        self.navigationController?.show(registViewController, sender: nil)
    }
    
    // NavigationBarのキャンセルタップされた時に呼ばれるメソッド
    @objc func handleCancelButton(_ sender: UIButton, forEvent event: UIEvent) {
        self.dismiss(animated: true, completion: nil)
    }

}
