//
//  AppDelegate.swift
//  Celebration
//
//  Created by Gregory Oberemkov on 04/05/2019.
//  Copyright © 2019 Gregory Oberemkov. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let googleMapKey = "AIzaSyDZwVih5mAM1hzcQVYnBZTQ0ATw8v5RS7k"
        GMSServices.provideAPIKey(googleMapKey)
        
        window = UIWindow.init()
        
        window?.makeKeyAndVisible()
        
        let tabbarController =  UITabBarController()
        
        let mapViewController = UIViewController()
        let jorneyViewController = UIViewController()
        let settingsViewController = UIViewController()
        
        tabbarController.setViewControllers([mapViewController, jorneyViewController, settingsViewController], animated: true)
        
        window?.rootViewController = tabbarController
        
        return true
    }
}

