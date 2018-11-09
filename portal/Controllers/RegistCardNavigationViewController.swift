//
//  RegistCardNavigationViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/11/09.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit

class RegistCardNavigationViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "次へ", style: .done, target: self, action: #selector(handleNextButton(_:forEvent:)))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "閉じる", style: .done, target: self, action: #selector(handleCancelButton(_:forEvent:)))
    }
    
    @objc func handleNextButton(_ sender: UIButton, forEvent event: UIEvent) {
        let registCardAccountSelectViewController = RegistCardAccountSelectViewController(nibName: "RegistCardAccountSelectViewController", bundle: nil)
        self.navigationController?.show(registCardAccountSelectViewController, sender: nil)
    }

    @objc func handleCancelButton(_ sender: UIButton, forEvent event: UIEvent) {
        self.dismiss(animated: true, completion: nil)
    }
}
