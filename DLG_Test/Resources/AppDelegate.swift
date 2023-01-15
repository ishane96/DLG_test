//
//  AppDelegate.swift
//  DLG_Test
//
//  Created by Achintha kahawalage on 2023-01-11.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
    
        let controller = HomeVC()
        let navController = UINavigationController(rootViewController: controller)
        navController.navigationBar.backgroundColor = UIColor(named: "green")
        window?.rootViewController = navController
        
        return true
    }


}

