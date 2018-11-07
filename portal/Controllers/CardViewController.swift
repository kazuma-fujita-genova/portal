//
//  CardViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/18.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit

import MaterialComponents.MaterialColorScheme
import MaterialComponents.MaterialAppBar
import MaterialComponents.MaterialAppBar_ColorThemer
import MaterialComponents.MaterialAppBar_TypographyThemer
import MaterialComponents.MaterialTabs
import MaterialComponents.MaterialTypographyScheme
import MaterialComponents.MaterialFlexibleHeader_CanAlwaysExpandToMaximumHeight

class CardViewController: MDCTabBarViewController {
    
    lazy var appBarViewController: MDCAppBarViewController = self.makeAppBar()
    var colorScheme = MDCSemanticColorScheme()
    var typographyScheme = MDCTypographyScheme()
    
    var cardView = CardView.instance()
    
    let cardDict:[[String:String?]] = [
                ["name":"本人ハナコ",
                 "qr_code_image":"https://contents.nomoca.com/qr/2493/0rlUyeHEDg46qEug.png",
                 "relationship": nil
                ],
                ["name":"しんさつ太郎",
                 "qr_code_image":"https://contents.nomoca.com/qr/2561/qU1RXxZIhywQirs1.png",
                "relationship":"子"
                ],
                ["name":"しんさつまさつかさん",
                 "qr_code_image":"https://contents.nomoca.com/qr/2561/qU1RXxZIhywQirs1.png",
                 "relationship":"孫"
                ]
        ]
    
    lazy var mDCTabBar: MDCTabBar = {
        let mDCTabBar = MDCTabBar()
        mDCTabBar.alignment = .centerSelected
        
        // TODO: モックコード
        var items = [UITabBarItem]()
        for (index, card) in self.cardDict.enumerated() {
            let tabTitle = card["name"]! ?? ""
            let item = UITabBarItem(title: tabTitle, image: nil, tag: index)
            items.append(item)
        }
        items.append(UITabBarItem(title: "家族の診察券を追加", image: nil, tag: self.cardDict.count))
        mDCTabBar.items = items
        /*
        mDCTabBar.items = [
            UITabBarItem(title: "○○の診察券", image: nil, tag:ConstIndex.myCard),
            UITabBarItem(title: "家族診察券", image: nil, tag:0)
        ]
         */
        
        mDCTabBar.selectedItem = mDCTabBar.items[0]
        
        mDCTabBar.delegate = self
        
        mDCTabBar.setTitleColor(UIColor.gray, for: .normal)
        mDCTabBar.setTitleColor(UIColor.black, for: .selected)
        
        return mDCTabBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    
        let url = URL(string: self.cardDict[0]["qr_code_image"]! ?? "")
        let data = try? Data(contentsOf: url!)
        if let imageData = data {
            let image = UIImage(data: imageData)
            cardView.qrCodeImageView.image = image
        }
        self.view.addSubview(cardView)
        
        setupAppBarView()
        self.tabBarHidden = true
    }
    
    private func setupAppBarView() {
        colorScheme.primaryColor = .white
        MDCAppBarColorThemer.applyColorScheme(colorScheme, to: appBarViewController)
        MDCAppBarTypographyThemer.applyTypographyScheme(typographyScheme, to: appBarViewController)
        self.view.addSubview(appBarViewController.view)
        appBarViewController.didMove(toParent: self)
    }
    
    private func makeAppBar() -> MDCAppBarViewController {
        let appBarViewController = MDCAppBarViewController()
        
        self.addChild(appBarViewController)
        
        // Give the tab bar enough height to accomodate all possible item appearances.
        appBarViewController.headerView.minMaxHeightIncludesSafeArea = false
        appBarViewController.inferTopSafeAreaInsetFromViewController = true
        appBarViewController.headerView.canAlwaysExpandToMaximumHeight = true
        appBarViewController.headerView.sharedWithManyScrollViews = true
        
        appBarViewController.headerView.tintColor = .gray
        appBarViewController.headerView.minimumHeight = 56
        appBarViewController.headerView.maximumHeight = 128
        
        appBarViewController.headerStackView.bottomBar = mDCTabBar
        
        return appBarViewController
    }
    
    override func tabBar(_ tabBar: MDCTabBar, didSelect item: UITabBarItem) {
        
        print(item.tag)
        let url = URL(string: self.cardDict[item.tag]["qr_code_image"]! ?? "")
        let data = try? Data(contentsOf: url!)
        if let imageData = data {
            let image = UIImage(data: imageData)
            cardView.qrCodeImageView.image = image
        }
        self.view.addSubview(cardView)
        view.addSubview(appBarViewController.view)

/*
        switch item.tag {
        case ConstIndex.myCard:
            print("My Card")
            //selectedViewController = self.viewControllers[ConstIndex.keywordSearch]
        case 1:
            print("Family Card")
            //selectedViewController = self.viewControllers[ConstIndex.mapSearch]
            view.addSubview(appBarViewController.view)
        default:
            print("other")
        }
 */
    }
}
