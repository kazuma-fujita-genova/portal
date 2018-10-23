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

class SearchViewController: UIViewController {

    lazy var appBarViewController: MDCAppBarViewController = self.makeAppBar()
    var colorScheme = MDCSemanticColorScheme()
    var typographyScheme = MDCTypographyScheme()
    
    fileprivate let firstTab = KeywordSearchViewController(nibName: "KeywordSearchViewController", bundle: nil)
    fileprivate let secondTab = MapSearchViewController(nibName: "MapSearchViewController", bundle: nil)
    
    lazy var tabBar: MDCTabBar = {
        let tabBar = MDCTabBar()
        tabBar.alignment = .justified
        
        tabBar.items = [
            UITabBarItem(title: ConstTitle.keywordSearch, image: nil, tag:0),
            UITabBarItem(title: ConstTitle.mapSearch, image: nil, tag:1)
        ]
        tabBar.selectedItem = tabBar.items[0]
        
        tabBar.delegate = self as? MDCTabBarDelegate
        
        return tabBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        MDCAppBarColorThemer.applyColorScheme(colorScheme, to: appBarViewController)
        MDCAppBarTypographyThemer.applyTypographyScheme(typographyScheme, to: appBarViewController)
        
        self.view.backgroundColor = colorScheme.backgroundColor
        self.view.addSubview(appBarViewController.view)
        appBarViewController.didMove(toParent: self)
        
        //switchToTab(firstTab)
    }
/*
    fileprivate func switchToTab(_ tab: ViewController) {
        //appBarViewController.headerView.trackingScrollWillChange(toScroll: tab.tableView)
        
        if let currentTab = currentTab {
            //currentTab.headerView = nil
            currentTab.willMove(toParent: nil)
            currentTab.view.removeFromSuperview()
            currentTab.removeFromParent()
        }
        
        if let tabView = tab.view {
            tabView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            tabView.frame = view.bounds
        }
        
        view.addSubview(tab.tableView)
        view.sendSubview(toBack: tab.tableView)
        tab.didMove(toParentViewController: self)
        
        tab.headerView = appBarViewController.headerView
        
        // appBarViewController.headerView.trackingScrollView = tab.tableView
        currentTab = tab
    }
 */
    
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
        
        appBarViewController.headerStackView.bottomBar = tabBar
        
        return appBarViewController
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
