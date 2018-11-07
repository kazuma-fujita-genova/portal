//
//  SettingViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/24.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextFields
import MaterialComponents.MaterialAppBar
import MaterialComponents.MaterialAppBar_ColorThemer
import MaterialComponents.MaterialAppBar_TypographyThemer

class SettingViewController: UIViewController {

    // Step 1: Create and initialize an App Bar.
    let appBarViewController = MDCAppBarViewController()
    var colorScheme = MDCSemanticColorScheme()
    var typographyScheme = MDCTypographyScheme()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // NavigationBar設定
        self.title = "設定"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "戻る", style: .done, target: self, action: #selector(handleCancelButton(_:forEvent:)))
        
        setupAppBar()
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
        
        // Recommended step: Set the tracking scroll view.
        // appBarViewController.headerView.trackingScrollView = self.tableView
        
        // Step 2: Register the App Bar views.
        view.addSubview(appBarViewController.view)
        appBarViewController.didMove(toParent: self)
    }
    
    // NavigationBarのキャンセルタップされた時に呼ばれるメソッド
    @objc func handleCancelButton(_ sender: UIButton, forEvent event: UIEvent) {
        self.navigationController?.popViewController(animated: true)
    }
}
