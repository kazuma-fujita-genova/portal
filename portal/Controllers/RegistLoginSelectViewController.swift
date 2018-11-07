//
//  RegistLoginSelectViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/11/06.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextFields
import MaterialComponents.MaterialAppBar
import MaterialComponents.MaterialAppBar_ColorThemer
import MaterialComponents.MaterialAppBar_TypographyThemer
import MaterialComponents.MaterialButtons_ButtonThemer

class RegistLoginSelectViewController: UIViewController {

    @IBOutlet weak var privacyPolicyButton: MDCButton!
    
    @IBOutlet weak var termsButton: MDCButton!
    
    @IBOutlet weak var loginButton: MDCButton!
    
    @IBOutlet weak var registButton: MDCButton!
    
    @IBOutlet weak var cancelButton: MDCButton!
    
    // Step 1: Create and initialize an App Bar.
    let appBarViewController = MDCAppBarViewController()
    var colorScheme = MDCSemanticColorScheme()
    var typographyScheme = MDCTypographyScheme()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "閉じる", style: .done, target: self, action: #selector(handleCancelButton(_:forEvent:)))
        
        buttonSetup()
        setupAppBar()
    }
    
    private func buttonSetup() {
        //let backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        
        let buttonScheme = MDCButtonScheme()
        MDCContainedButtonThemer.applyScheme(buttonScheme, to: loginButton)
        loginButton.addTarget(self, action: #selector(handleLoginButton(_:forEvent:)), for: .touchUpInside)
        MDCContainedButtonThemer.applyScheme(buttonScheme, to: registButton)
        registButton.addTarget(self, action: #selector(handleRegistButton(_:forEvent:)), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(handleCancelButton(_:forEvent:)), for: .touchUpInside)
    }
    
    private func setupAppBar() {
        // Behavioral flags.
        appBarViewController.inferTopSafeAreaInsetFromViewController = true
        appBarViewController.headerView.minMaxHeightIncludesSafeArea = false
        
        // Step 2: Add the headerViewController as a child.
        self.addChild(appBarViewController)
        
        colorScheme.primaryColor = .white
        colorScheme.onPrimaryColor = .black
        
        MDCAppBarColorThemer.applyColorScheme(colorScheme, to: appBarViewController)
        MDCAppBarTypographyThemer.applyTypographyScheme(typographyScheme, to: appBarViewController)
        
        // Allows us to avoid forwarding events, but means we can't enable shift behaviors.
        appBarViewController.headerView.observesTrackingScrollViewScrollEvents = true
        // Step 2: Register the App Bar views.
        view.addSubview(appBarViewController.view)
        appBarViewController.didMove(toParent: self)
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
