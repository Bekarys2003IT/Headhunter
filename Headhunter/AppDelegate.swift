//
//  AppDelegate.swift
//  Headhunter
//
//  Created by Bekarys Sandigali on 22.03.2024.
//

import UIKit
//import FirebaseCore
import Firebase
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: TabBarController())
        window?.makeKeyAndVisible()
        FirebaseApp.configure()
        return true
    }
}
