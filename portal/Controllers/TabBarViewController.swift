//
//  TabBarController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/23.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import MaterialComponents.MaterialBottomNavigation_ColorThemer
import MaterialComponents.MaterialTypographyScheme

class TabBarViewController: UITabBarController, MDCBottomNavigationBarDelegate {
    
    var colorScheme = MDCSemanticColorScheme()
    var typographyScheme = MDCTypographyScheme()
    let bottomNavBar = MDCBottomNavigationBar()
    
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        bottomNavBar.delegate = self
        colorScheme.backgroundColor = .white
        colorScheme.primaryColor = .white
        colorScheme.onPrimaryColor = .black
        
        view.backgroundColor = colorScheme.backgroundColor
        
        let cardViewController = CardViewController(nibName: "CardViewController", bundle: nil)
        let searchViewController = SearchViewController(nibName: "SearchViewController", bundle: nil)
        let favoriteViewController = FavoriteViewController(nibName: "FavoriteViewController", bundle: nil)
        // TODO: 暫定で新規登録画面表示。新規登録実装後遷移先をかかりつけに変更
        //let favoriteViewController = RegistViewController(nibName: "RegistViewController", bundle: nil)
        let notifyListViewController = NotifyListViewController(nibName: "NotifyListViewController", bundle: nil)
        let profileViewController = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        // let registViewController = RegistViewController(nibName: "RegistViewController", bundle: nil)
        self.viewControllers = [cardViewController, searchViewController, favoriteViewController, notifyListViewController, profileViewController]
        
        selectedViewController = self.viewControllers?[ConstIndex.favorite]
        
        let tabBarItem1 = UITabBarItem(title: ConstTitle.card, image: UIImage(named: ConstImage.card), tag: ConstIndex.card)
        let tabBarItem2 = UITabBarItem(title: ConstTitle.search, image: UIImage(named: ConstImage.search), tag: ConstIndex.search)
        let tabBarItem3 = UITabBarItem(title: ConstTitle.favorite, image: UIImage(named: ConstImage.favorite), tag: ConstIndex.favorite)
        tabBarItem3.selectedImage = UIImage(named: "favorite")
        let tabBarItem4 = UITabBarItem(title: ConstTitle.notify, image: UIImage(named: ConstImage.notify), tag: ConstIndex.notify)
        let tabBarItem5 = UITabBarItem(title: ConstTitle.profile, image: UIImage(named: ConstImage.profile), tag: ConstIndex.profile)
        
        bottomNavBar.items = [ tabBarItem1, tabBarItem2, tabBarItem3, tabBarItem4, tabBarItem5 ]
        bottomNavBar.selectedItem = tabBarItem3
        
        MDCBottomNavigationBarColorThemer.applySemanticColorScheme(colorScheme, toBottomNavigation: bottomNavBar)
        
        view.addSubview(bottomNavBar)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
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
