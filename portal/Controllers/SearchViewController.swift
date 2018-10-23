//
//  SearchViewController.swift
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

class SearchViewController: MDCTabBarViewController {

    lazy var appBarViewController: MDCAppBarViewController = self.makeAppBar()
    var colorScheme = MDCSemanticColorScheme()
    var typographyScheme = MDCTypographyScheme()
    
    lazy var mDCTabBar: MDCTabBar = {
        let mDCTabBar = MDCTabBar()
        mDCTabBar.alignment = .justified
        
        mDCTabBar.items = [
            UITabBarItem(title: ConstTitle.keywordSearch, image: nil, tag:ConstIndex.keywordSearch),
            UITabBarItem(title: ConstTitle.mapSearch, image: nil, tag:ConstIndex.mapSearch)
        ]
        mDCTabBar.selectedItem = mDCTabBar.items[0]
        
        mDCTabBar.delegate = self
        
        return mDCTabBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        MDCAppBarColorThemer.applyColorScheme(colorScheme, to: appBarViewController)
        MDCAppBarTypographyThemer.applyTypographyScheme(typographyScheme, to: appBarViewController)
        
        self.view.backgroundColor = colorScheme.backgroundColor
        
        let keywordSearchViewController = KeywordSearchViewController(nibName: "KeywordSearchViewController", bundle: nil)
        let mapSearchViewController = MapSearchViewController(nibName: "MapSearchViewController", bundle: nil)
        self.viewControllers = [keywordSearchViewController, mapSearchViewController]
        selectedViewController = self.viewControllers[ConstIndex.keywordSearch]

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
        
        appBarViewController.headerView.minimumHeight = 56
        appBarViewController.headerView.maximumHeight = 128
        
        appBarViewController.headerStackView.bottomBar = mDCTabBar
        
        return appBarViewController
    }
    
    override func tabBar(_ tabBar: MDCTabBar, didSelect item: UITabBarItem) {
        switch item.tag {
            case ConstIndex.keywordSearch:
                print("KeywordSearch")
                selectedViewController = self.viewControllers[ConstIndex.keywordSearch]
            case ConstIndex.mapSearch:
                print("MapSearch")
                selectedViewController = self.viewControllers[ConstIndex.mapSearch]
                view.addSubview(appBarViewController.view)
            default:
                print("other")
        }
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
