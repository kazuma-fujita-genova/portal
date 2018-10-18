//
//  RegistViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/18.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit
import Alamofire
import MaterialComponents.MaterialTextFields

class RegistViewController: UIViewController {

    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var mobileTelTextField: UITextField!
    
    @IBOutlet weak var sendButton: UIButton!
    
    @IBAction func handleSendButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // setupTextFields()
    }
    
    func setupTextFields() {
        // let nameController = MDCTextInputControllerUnderline(textInput: nickname)
        // nickname.text = "Grace Hopper"
        // nameController.placeholderText = "Name"
        // nameController.helperText = "First and Last"
        //nameController.textInput!.tag = 0

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
