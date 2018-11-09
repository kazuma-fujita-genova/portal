//
//  RegistViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/18.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit

import MaterialComponents.MaterialTextFields
// import MaterialComponents.MaterialAppBar
// import MaterialComponents.MaterialAppBar_ColorThemer
// import MaterialComponents.MaterialAppBar_TypographyThemer
import MaterialComponents.MaterialButtons_ButtonThemer

class LoginViewController: UIViewController {
    
    var allTextFieldControllers = [MDCTextInputControllerUnderline]()
    
    // Step 1: Create and initialize an App Bar.
    // let appBarViewController = MDCAppBarViewController()
    // var colorScheme = MDCSemanticColorScheme()
    // var typographyScheme = MDCTypographyScheme()
    
    @IBOutlet weak var mobileTelField: MDCTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // NavigationBar設定
        self.title = "ログイン"
        // self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "送信", style: .done, target: self, action: #selector(handleSendButton(_:forEvent:)))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "戻る", style: .done, target: self, action: #selector(handleCancelButton(_:forEvent:)))

        setupTextFields()
        // setupButton()
        // setupAppBar()
    }
    /*
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
     */
    
    @objc func handleToRegistButton (_ sender: UIButton, forEvent event: UIEvent) {
        self.dismiss(animated: true, completion: nil)
        let registViewController = RegistViewController(nibName: "RegistViewController", bundle: nil)
        // let navigationController = MDCAppBarNavigationController(rootViewController: registViewController)
        let navigationController = UINavigationController(rootViewController: registViewController)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    // NavigationBarの送信ボタンがタップされた時に呼ばれるメソッド
    @objc func handleSendButton(_ sender: UIButton, forEvent event: UIEvent) {
        let authViewController = AuthViewController(nibName: "AuthViewController", bundle: nil)
        self.navigationController?.show(authViewController, sender: nil)
    }
    
    // NavigationBarのキャンセルタップされた時に呼ばれるメソッド
    @objc func handleCancelButton(_ sender: UIButton, forEvent event: UIEvent) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupTextFields() {
        let mobileTelFieldController = MDCTextInputControllerUnderline(textInput: mobileTelField)
        // mobileTelField.delegate = self as? UITextFieldDelegate
        mobileTelFieldController.placeholderText = "携帯電話番号"
        mobileTelFieldController.helperText = "ハイフンなし"
        // let mobileTelTextInput = mobileTelFieldController.textInput as! MDCTextField
        // mobileTelTextInput.tag = 1
        self.allTextFieldControllers.append(mobileTelFieldController)
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
