//
//  RegistCardConfirmViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/11/09.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit

import MaterialComponents.MaterialTextFields
import MaterialComponents.MaterialButtons_ButtonThemer

import MaterialComponents.MaterialSnackbar
import MaterialComponents.MaterialSnackbar_ColorThemer
import MaterialComponents.MaterialSnackbar_TypographyThemer

class RegistCardConfirmViewController: UIViewController {
    
    let colorScheme = MDCSemanticColorScheme()
    let typographyScheme = MDCTypographyScheme()
    let toastMessage = MDCSnackbarMessage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //colorScheme.onPrimaryColor = .black
        MDCSnackbarColorThemer.applySemanticColorScheme(colorScheme)
        MDCSnackbarTypographyThemer.applyTypographyScheme(typographyScheme)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "閉じる", style: .done, target: self, action: #selector(handleCancelButton(_:forEvent:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登録", style: .done, target: self, action: #selector(handleRegistButton(_:forEvent:)))
        
        buttonSetup()
    }
    
    private func buttonSetup() {
    }
    
    @objc func handleRegistButton (_ sender: UIButton, forEvent event: UIEvent) {
        toastMessage.text = "診察券を登録しました"
        MDCSnackbarManager.show(toastMessage)
        self.dismiss(animated: true, completion: nil)
    }

    @objc func handleCancelButton(_ sender: UIButton, forEvent event: UIEvent) {
        self.navigationController?.popViewController(animated: true)
    }
}
