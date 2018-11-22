//
//  TabBarController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/23.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import MaterialComponents.MaterialBottomNavigation_ColorThemer
import MaterialComponents.MaterialTypographyScheme
import AMScrollingNavbar

class TabBarViewController: UITabBarController, MDCBottomNavigationBarDelegate {
    
    var colorScheme = MDCSemanticColorScheme()
    var typographyScheme = MDCTypographyScheme()
    let bottomNavBar = MDCBottomNavigationBar()
    
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        bottomNavBar.delegate = self
        colorScheme.primaryColor = .white
        colorScheme.onPrimaryColor = .black
        
        // view.backgroundColor = colorScheme.backgroundColor
        
        // 診察券VC設定
        let cardViewController = CardViewController(nibName: "CardViewController", bundle: nil)
        // 施設検索VC設定
        let searchViewController = SearchViewController(nibName: "SearchViewController", bundle: nil)
        // かかりつけVCをrootとしたUINavigationBarを設定
        let favoriteViewController = FavoriteViewController(nibName: "FavoriteViewController", bundle: nil)
        // let favoriteNavigationController = UINavigationController(rootViewController: favoriteViewController)
        // AMScrollingNavbarでスクロール時NavigationBarの表示/非表示切り替え
        let favoriteNavigationController = ScrollingNavigationController(rootViewController: favoriteViewController)
        // お知らせVC設定
        let notifyListViewController = NotifyListViewController(nibName: "NotifyListViewController", bundle: nil)
        // プロフィールVCをrootとしたUINavigationBarを設定
        let profileViewController = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        // self.viewControllers = [cardViewController, searchViewController, favoriteViewController, notifyListViewController, profileNavigationController]
        self.viewControllers = [cardViewController, searchViewController, favoriteNavigationController, notifyListViewController, profileNavigationController]
        
        selectedViewController = self.viewControllers?[ConstIndex.favorite]
        
        let tabBarItem1 = UITabBarItem(title: ConstTitle.card, image: UIImage(named: ConstNavigationImage.card), tag: ConstIndex.card)
        let tabBarItem2 = UITabBarItem(title: ConstTitle.search, image: UIImage(named: ConstNavigationImage.search), tag: ConstIndex.search)
        let tabBarItem3 = UITabBarItem(title: ConstTitle.favorite, image: UIImage(named: ConstNavigationImage.favorite), tag: ConstIndex.favorite)
        // tabBarItem3.selectedImage = UIImage(named: "favorite")
        let tabBarItem4 = UITabBarItem(title: ConstTitle.notify, image: UIImage(named: ConstNavigationImage.notify), tag: ConstIndex.notify)
        let tabBarItem5 = UITabBarItem(title: ConstTitle.profile, image: UIImage(named: ConstNavigationImage.profile), tag: ConstIndex.profile)
        
        bottomNavBar.items = [ tabBarItem1, tabBarItem2, tabBarItem3, tabBarItem4, tabBarItem5 ]
        bottomNavBar.selectedItem = tabBarItem3
        
        MDCBottomNavigationBarColorThemer.applySemanticColorScheme(colorScheme, toBottomNavigation: bottomNavBar)
        
        view.addSubview(bottomNavBar)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func layoutBottomNavBar() {
        let size = bottomNavBar.sizeThatFits(view.bounds.size)
        let bottomNavBarFrame = CGRect(x: 0, y: view.bounds.height - size.height, width: size.width, height: size.height)
        bottomNavBar.frame = bottomNavBarFrame
    }
    /*
    func layoutBottomNavBar() {
        // iPhone X , X以外は0となる
        let window = UIApplication.shared.keyWindow
        let size = bottomNavBar.sizeThatFits(view.bounds.size)
        let screenHeight:CGFloat = (window?.bounds.height)!
    
        if ( window!.safeAreaInsets.bottom > 0 ) {
            let bottomNavBarFrame = CGRect(x: 0,
                                           y: screenHeight - size.height - 34,
                                           width: size.width,
                                           height: size.height)
            bottomNavBar.frame = bottomNavBarFrame
        }
        else {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: window!.safeAreaInsets.top + window!.safeAreaInsets.bottom + screenHeight + 20)
            let bottomNavBarFrame = CGRect(x: 0,
                                           y: screenHeight - size.height,
                                           width: size.width,
                                           height: size.height)
            bottomNavBar.frame = bottomNavBarFrame
        }
    }
    */
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
