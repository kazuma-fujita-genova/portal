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

    var colorScheme = MDCSemanticColorScheme()
    var typographyScheme = MDCTypographyScheme()
    
    let bottomNavBar = MDCBottomNavigationBar()
    
    var window: UIWindow?
    
    override func viewDidLoad() {
        colorScheme.backgroundColor = .white
        view.backgroundColor = colorScheme.backgroundColor
        
        let tabBarItem1 = UITabBarItem(title: ConstTitle.card, image: UIImage(named: ConstImage.card), tag: ConstIndex.card)
        let tabBarItem2 = UITabBarItem(title: ConstTitle.search, image: UIImage(named: ConstImage.search), tag: ConstIndex.search)
        let tabBarItem3 = UITabBarItem(title: ConstTitle.favorite, image: UIImage(named: ConstImage.favorite), tag: ConstIndex.favorite)
        tabBarItem3.selectedImage = UIImage(named: "favorite")
        let tabBarItem4 = UITabBarItem(title: ConstTitle.notify, image: UIImage(named: ConstImage.notify), tag: ConstIndex.notify)
        let tabBarItem5 = UITabBarItem(title: ConstTitle.profile, image: UIImage(named: ConstImage.profile), tag: ConstIndex.profile)
        
        let cardViewController = CardViewController(nibName: "CardViewController", bundle: nil)
        cardViewController.tabBarItem = tabBarItem1
        self.viewControllers?.append(cardViewController)
        
        let searchViewController = SearchViewController(nibName: "SearchViewController", bundle: nil)
        searchViewController.tabBarItem = tabBarItem2
        self.viewControllers?.append(searchViewController)
        
        let favoriteViewController = FavoriteViewController(nibName: "FavoriteViewController", bundle: nil)
        favoriteViewController.tabBarItem = tabBarItem3
        self.viewControllers?.append(favoriteViewController)
        
        let notifyListViewController = NotifyListViewController(nibName: "NotifyListViewController", bundle: nil)
        notifyListViewController.tabBarItem = tabBarItem4
        self.viewControllers?.append(notifyListViewController)
        
        let profileViewController = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        profileViewController.tabBarItem = tabBarItem5
        self.viewControllers?.append(profileViewController)
        
        self.viewControllers = [cardViewController, searchViewController, favoriteViewController, notifyListViewController, profileViewController]
        
        
        bottomNavBar.delegate = self

        bottomNavBar.items = [ tabBarItem1, tabBarItem2, tabBarItem3, tabBarItem4, tabBarItem5 ]
        bottomNavBar.selectedItem = tabBarItem3
        selectedViewController = self.viewControllers?[ConstIndex.favorite]

        MDCBottomNavigationBarColorThemer.applySemanticColorScheme(colorScheme, toBottomNavigation: bottomNavBar)
        
        view.addSubview(bottomNavBar)
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
        case ConstIndex.card:
            print("card")
            //self.selectedViewController = CardViewController(nibName: "CardViewController", bundle: nil)
            selectedViewController = self.viewControllers?[ConstIndex.card]
        case ConstIndex.search:
            print("search")
            selectedViewController = self.viewControllers?[ConstIndex.search]
        case ConstIndex.favorite:
            print("favorite")
            selectedViewController = self.viewControllers?[ConstIndex.favorite]
        case ConstIndex.notify:
            print("notify")
            selectedViewController = self.viewControllers?[ConstIndex.notify]
        case ConstIndex.profile:
            print("profile")
            selectedViewController = self.viewControllers?[ConstIndex.profile]
        default:
            print("other")
        }
    }
}
