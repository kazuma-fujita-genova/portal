//
//  AppDelegate.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/16.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // ページを格納する配列
        var viewControllers: [UIViewController] = []
        
        // 1ページ目になるViewController
        let firstSB = UIStoryboard(name: ConstStoryBoard.cardName, bundle: nil)
        let firstVC = firstSB.instantiateViewController(withIdentifier: ConstStoryBoard.cardId) as! CardViewController
        firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        viewControllers.append(firstVC)
        
        // 2ページ目になるViewController
        let secondSB = UIStoryboard(name:  ConstStoryBoard.searchName, bundle: nil)
        let secondVC = secondSB.instantiateViewController(withIdentifier: ConstStoryBoard.searchId) as! SearchViewController
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 2)
        viewControllers.append(secondVC)
        
        // 3ページ目になるViewController
        let thirdSB = UIStoryboard(name: ConstStoryBoard.favoriteName, bundle: nil)
        let thirdVC = thirdSB.instantiateViewController(withIdentifier: ConstStoryBoard.favoriteId) as! FavoriteViewController
        thirdVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 3)
        viewControllers.append(thirdVC)

        // 4ページ目になるViewController
        let fourthSB = UIStoryboard(name: ConstStoryBoard.notifyName, bundle: nil)
        let fourthVC = fourthSB.instantiateViewController(withIdentifier: ConstStoryBoard.notifyListId) as! NotifyListViewController
        fourthVC.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 4)
        viewControllers.append(fourthVC)

        // 5ページ目になるViewController
        let fifthSB = UIStoryboard(name: ConstStoryBoard.profileName, bundle: nil)
        let fifthVC = fifthSB.instantiateViewController(withIdentifier: ConstStoryBoard.profileId) as! ProfileViewController
        fifthVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 5)
        viewControllers.append(fifthVC)

        // ViewControllerをセット
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(viewControllers, animated: false)
        
        // rootViewControllerをUITabBarControllerにする
        window = UIWindow()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
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

