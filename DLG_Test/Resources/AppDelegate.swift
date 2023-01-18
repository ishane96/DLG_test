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
        window?.rootViewController = navController
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(named: "green")
            navController.navigationBar.standardAppearance = appearance;
            navController.navigationBar.scrollEdgeAppearance = navController.navigationBar.standardAppearance
        } else {
            navController.navigationBar.barTintColor = UIColor(named: "green")
            navController.navigationBar.isTranslucent = false
            navController.navigationBar.backgroundColor = UIColor(named: "green")
        }
       
        return true
    }


}

