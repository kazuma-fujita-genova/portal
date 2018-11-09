//
//  CardRegistNavigationViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/11/08.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit

import MaterialComponents.MaterialTextFields
import MaterialComponents.MaterialButtons_ButtonThemer

class CardRegistNavigationViewController: UIViewController {

    @IBOutlet weak var skipButton: MDCButton!
    
    @IBOutlet weak var readQrCodeButton: MDCButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "閉じる", style: .done, target: self, action: #selector(handleCancelButton(_:forEvent:)))

        buttonSetup()
    }
    
    private func buttonSetup() {
        
        let buttonScheme = MDCButtonScheme()
        MDCContainedButtonThemer.applyScheme(buttonScheme, to: readQrCodeButton)
        readQrCodeButton.addTarget(self, action: #selector(handleReadQrCodeButton(_:forEvent:)), for: .touchUpInside)
        
        skipButton.addTarget(self, action: #selector(handleCancelButton(_:forEvent:)), for: .touchUpInside)
    }
    
    @objc func handleReadQrCodeButton (_ sender: UIButton, forEvent event: UIEvent) {
        let readQRCodeViewController = ReadQRCodeViewController(nibName: "ReadQRCodeViewController", bundle: nil)
        // Push遷移
        self.navigationController?.show(readQRCodeViewController, sender: nil)
    }
    
    // Navigation Barのキャンセルタップされた時に呼ばれるメソッド
    @objc func handleCancelButton(_ sender: UIButton, forEvent event: UIEvent) {
        self.dismiss(animated: true, completion: nil)
    }
}
