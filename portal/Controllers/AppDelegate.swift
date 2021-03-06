//
//  AppDelegate.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/16.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // TODO: 環境ごとにAPIキーを変える
    let cGoogleMapsAPIKey = "AIzaSyAIYoqq8y7A799Oi0DvyvMPYQCOgjs_wd4"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
 
        // NavigationBarItemの色を変更
        UINavigationBar.appearance().tintColor = UIColor.black
        // NavigationBarの背景を変更
        UINavigationBar.appearance().barTintColor = UIColor.white
        // NavigationBarのタイトル文字列の色を変更
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        // NavigationBarを透過
        // UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        // NavigationBarの下線を消す
        UINavigationBar.appearance().shadowImage = UIImage()
        // Google Mapsの初期設定
        GMSServices.provideAPIKey(cGoogleMapsAPIKey)
        
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

