//
//  SettingViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/24.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextFields
import FDFullscreenPopGesture

class SettingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // NavigationBar設定
        self.title = "設定"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "戻る", style: .done, target: self, action: #selector(handleCancelButton(_:forEvent:)))
        // スワイプで画面戻る処理追加
        self.navigationController?.fd_fullscreenPopGestureRecognizer.isEnabled = true
    }
    
    // NavigationBarのキャンセルタップされた時に呼ばれるメソッド
    @objc func handleCancelButton(_ sender: UIButton, forEvent event: UIEvent) {
        self.navigationController?.popViewController(animated: true)
    }
}
