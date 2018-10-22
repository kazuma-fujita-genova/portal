//
//  ViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/16.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

// import UIKit

import MaterialComponents.MaterialBottomNavigation_ColorThemer
import MaterialComponents.MaterialTypographyScheme

class ViewController: UITabBarController, MDCBottomNavigationBarDelegate {
// class ViewController: UITabBarController {

    var colorScheme = MDCSemanticColorScheme()
    var typographyScheme = MDCTypographyScheme()
    
    let bottomNavBar = MDCBottomNavigationBar()
    
    var window: UIWindow?
    
    override func viewDidLoad() {
        colorScheme.backgroundColor = .white
        view.backgroundColor = colorScheme.backgroundColor
        
        let tabBarItem1 = UITabBarItem(title: ConstTitle.card, image: UIImage(named: "assignment"), tag: ConstTag.card)
        let tabBarItem2 = UITabBarItem(title: ConstTitle.search, image: UIImage(named: "search"), tag: ConstTag.search)
        // let tabBarItem3 = UITabBarItem(title: ConstTitle.favorite, image: UIImage(named: "favorite_border"), tag: ConstTag.favorite)
        // tabBarItem3.selectedImage = UIImage(named: "favorite")
        // let tabBarItem4 = UITabBarItem(title: ConstTitle.notify, image: UIImage(named: "notifications_none"), tag: ConstTag.notify)
        // let tabBarItem5 = UITabBarItem(title: ConstTitle.profile, image: UIImage(named: "perm_identity"), tag: ConstTag.profile)

        
        // ページを格納する配列
        //var viewControllers: [UIViewController] = []
        // Register Nib
        let cardViewController = CardViewController(nibName: "CardViewController", bundle: nil)
        cardViewController.tabBarItem = tabBarItem1
        let nv1 = UINavigationController(rootViewController: cardViewController)
        // viewControllers.append(cardViewController)
        // self.viewControllers?.append(cardViewController)
        
        let searchViewController = SearchViewController(nibName: "SearchViewController", bundle: nil)
        searchViewController.tabBarItem = tabBarItem2
        // viewControllers.append(searchViewController)
        // self.viewControllers?.append(searchViewController)
        let nv2 = UINavigationController(rootViewController: searchViewController)
        
        let myTabs = NSArray(objects:nv1,nv2)
        
        
        // self.viewControllers = [cardViewController, searchViewController]
        self.setViewControllers(myTabs as? [UIViewController], animated: false)
        
        //bottomNavBar.items = [ tabBarItem1, tabBarItem2, tabBarItem3, tabBarItem4, tabBarItem5 ]
        bottomNavBar.items = [ tabBarItem1, tabBarItem2 ]
        //bottomNavBar.selectedItem = tabBarItem3
        
        // bottomNavBar.delegate = self
        
        view.addSubview(bottomNavBar)
        
        // rootViewControllerをUITabBarControllerにする
        window = UIWindow()
        window?.rootViewController = self
        window?.makeKeyAndVisible()

        
        MDCBottomNavigationBarColorThemer.applySemanticColorScheme(colorScheme, toBottomNavigation: bottomNavBar)
    }
    
    func layoutBottomNavBar() {
        let size = bottomNavBar.sizeThatFits(view.bounds.size)
        let bottomNavBarFrame = CGRect(x: 0,
                                       y: view.bounds.height - size.height,
                                       width: size.width,
                                       height: size.height)
        bottomNavBar.frame = bottomNavBarFrame
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layoutBottomNavBar()
    }
    
    #if swift(>=3.2)
    @available(iOS 11, *)
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        layoutBottomNavBar()
    }
    #endif

    func bottomNavigationBar(_ bottomNavigationBar: MDCBottomNavigationBar, didSelect item: UITabBarItem) {
        
        switch item.tag {
        case ConstTag.card:
            print("card")
        case ConstTag.search:
            print("search")
        case ConstTag.favorite:
            print("favorite")
        case ConstTag.notify:
            print("notify")
        case ConstTag.profile:
            print("profile")
        default:
            print("other")
        }
    }
}
