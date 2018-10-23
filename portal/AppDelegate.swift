//
//  AppDelegate.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/16.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit
// import MaterialComponents.MaterialBottomNavigation_ColorThemer
// import MaterialComponents.MaterialTypographyScheme


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // var colorScheme = MDCSemanticColorScheme()
    // var typographyScheme = MDCTypographyScheme()
    
    // let bottomNavBar = MDCBottomNavigationBar()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
  
         // ページを格納する配列
        /*
         var viewControllers: [UIViewController] = []
        
        let tabBarItem1 = UITabBarItem(title: ConstTitle.card, image: UIImage(named: "assignment"), tag: ConstIndex.card)
        let tabBarItem2 = UITabBarItem(title: ConstTitle.search, image: UIImage(named: "search"), tag: ConstIndex.search)
        let tabBarItem3 = UITabBarItem(title: ConstTitle.favorite, image: UIImage(named: "favorite_border"), tag: ConstIndex.favorite)
        tabBarItem3.selectedImage = UIImage(named: "favorite")
        let tabBarItem4 = UITabBarItem(title: ConstTitle.notify, image: UIImage(named: "notifications_none"), tag: ConstIndex.notify)
        let tabBarItem5 = UITabBarItem(title: ConstTitle.profile, image: UIImage(named: "perm_identity"), tag: ConstIndex.profile)
        
        let cardViewController = CardViewController(nibName: "CardViewController", bundle: nil)
        cardViewController.tabBarItem = tabBarItem1
        viewControllers.append(cardViewController)

        let searchViewController = SearchViewController(nibName: "SearchViewController", bundle: nil)
        searchViewController.tabBarItem = tabBarItem2
        viewControllers.append(searchViewController)

        let favoriteViewController = FavoriteViewController(nibName: "FavoriteViewController", bundle: nil)
        favoriteViewController.tabBarItem = tabBarItem3
        viewControllers.append(favoriteViewController)

        let notifyListViewController = NotifyListViewController(nibName: "NotifyListViewController", bundle: nil)
        notifyListViewController.tabBarItem = tabBarItem4
        viewControllers.append(notifyListViewController)

        let profileViewController = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        profileViewController.tabBarItem = tabBarItem5
        viewControllers.append(profileViewController)
         
        // ViewControllerをセット
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(viewControllers, animated: false)
        
        // rootViewControllerをUITabBarControllerにする
        window = UIWindow()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        */
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

