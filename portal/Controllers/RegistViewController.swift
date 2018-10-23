//
//  RegistViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/18.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit

import MaterialComponents.MaterialTextFields

class RegistViewController: UIViewController {

    @IBOutlet weak var nicknameField: MDCTextField! = {
        let nicknameField = MDCTextField()
        // nicknameField.translatesAutoresizingMaskIntoConstraints = false
        nicknameField.autocapitalizationType = .words
        return nicknameField
    }()
    
    @IBOutlet weak var mobileTelField: MDCTextField! = {
        let mobileTelField = MDCTextField()
        // mobileTelField.translatesAutoresizingMaskIntoConstraints = false
        return mobileTelField
    }()
    
    @IBOutlet weak var sendButton: UIButton!
    
    
    
    @IBAction func handleSendButton(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTextFields()
    }
    
    func setupTextFields() {
        let nicknameFieldController = MDCTextInputControllerUnderline(textInput: nicknameField)
        nicknameField.delegate = self as? UITextFieldDelegate
        //nicknameField.placeholder = "Name"
        nicknameFieldController.placeholderText = "ニックネーム"
        nicknameFieldController.helperText = "10文字以内"
        let nicknameTextInput = nicknameFieldController.textInput as! MDCTextField
        nicknameTextInput.tag = 0
        
        let mobileTelFieldController = MDCTextInputControllerUnderline(textInput: mobileTelField)
        mobileTelField.delegate = self as? UITextFieldDelegate
        mobileTelFieldController.placeholderText = "携帯電話番号"
        mobileTelFieldController.helperText = "ハイフンなし"
        let mobileTelTextInput = mobileTelFieldController.textInput as! MDCTextField
        mobileTelTextInput.tag = 1
        
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
