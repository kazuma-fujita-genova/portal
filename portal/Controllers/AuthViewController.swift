//
//  RegistViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/18.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit

import MaterialComponents.MaterialTextFields

class AuthViewController: UIViewController {
    
    var allTextFieldControllers = [MDCTextInputControllerUnderline]()
    
    @IBOutlet weak var authCodeField: MDCTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupTextFields()
        
        // NavigationBar設定
        self.title = "確認コード入力"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "ログイン", style: .done, target: self, action: #selector(handleAuthButton(_:forEvent:)))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "閉じる", style: .done, target: self, action: #selector(handleCancelButton(_:forEvent:)))
    }

    // Navigation Barの確認ボタンがタップされた時に呼ばれるメソッド
    @objc func handleAuthButton(_ sender: UIButton, forEvent event: UIEvent) {
        let cardRegistNavigationViewController = CardRegistNavigationViewController(nibName: "CardRegistNavigationViewController", bundle: nil)
        // Push遷移
        self.navigationController?.show(cardRegistNavigationViewController, sender: nil)
    }
    
    // Navigation Barのキャンセルタップされた時に呼ばれるメソッド
    @objc func handleCancelButton(_ sender: UIButton, forEvent event: UIEvent) {
        self.dismiss(animated: true, completion: nil)
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
}
