//
//  RegistViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/18.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit

import MaterialComponents.MaterialTextFields
import MaterialComponents.MaterialAppBar
import MaterialComponents.MaterialAppBar_ColorThemer
import MaterialComponents.MaterialAppBar_TypographyThemer

class AuthViewController: UIViewController {
    
    var allTextFieldControllers = [MDCTextInputControllerUnderline]()
    
    // Step 1: Create and initialize an App Bar.
    let appBarViewController = MDCAppBarViewController()
    var colorScheme = MDCSemanticColorScheme()
    var typographyScheme = MDCTypographyScheme()
    
    @IBOutlet weak var authCodeField: MDCTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupTextFields()
        
        // App Bar
        self.title = "確認コード入力"
        
        // Behavioral flags.
        appBarViewController.inferTopSafeAreaInsetFromViewController = true
        appBarViewController.headerView.minMaxHeightIncludesSafeArea = false
        
        // Step 2: Add the headerViewController as a child.
        self.addChild(appBarViewController)
        
        MDCAppBarColorThemer.applyColorScheme(colorScheme, to: appBarViewController)
        MDCAppBarTypographyThemer.applyTypographyScheme(typographyScheme, to: appBarViewController)
        
        // Allows us to avoid forwarding events, but means we can't enable shift behaviors.
        appBarViewController.headerView.observesTrackingScrollViewScrollEvents = true
        
        // Recommended step: Set the tracking scroll view.
        // appBarViewController.headerView.trackingScrollView = self.tableView
        
        // Step 2: Register the App Bar views.
        view.addSubview(appBarViewController.view)
        appBarViewController.didMove(toParent: self)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "確認", style: .done, target: self, action: #selector(handleAuthButton(_:forEvent:)))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "閉じる", style: .done, target: self, action: #selector(handleCancelButton(_:forEvent:)))
        // NavigationBar表示
        self.navigationController?.setNavigationBarHidden(false, animated: true)

    }
    
    // Navigation Barの確認ボタンがタップされた時に呼ばれるメソッド
    @objc func handleAuthButton(_ sender: UIButton, forEvent event: UIEvent) {
        dismiss(animated: true, completion: nil)
    }
    
    // Navigation Barのキャンセルタップされた時に呼ばれるメソッド
    @objc func handleCancelButton(_ sender: UIButton, forEvent event: UIEvent) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupTextFields() {
        let authCodeFieldController = MDCTextInputControllerUnderline(textInput: authCodeField)
        // authCodeField.delegate = self as? UITextFieldDelegate
        authCodeFieldController.placeholderText = "確認コード"
        authCodeFieldController.helperText = "4桁の確認コード"
        // let mobileTelTextInput = authCodeFieldController.textInput as! MDCTextField
        // mobileTelTextInput.tag = 1
        self.allTextFieldControllers.append(authCodeFieldController)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
