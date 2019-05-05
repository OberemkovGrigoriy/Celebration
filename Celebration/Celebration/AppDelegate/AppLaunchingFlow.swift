//
//  AppLaunchingFlow.swift
//  Celebration
//
//  Created by Gregory Oberemkov on 05/05/2019.
//  Copyright © 2019 Gregory Oberemkov. All rights reserved.
//

import UIKit

final class AppLaunchingFlow {
    
    func startFlow() -> UITabBarController {
        let tabbarController =  UITabBarController()
        
        let eventsMapViewController = EventsMapViewController()
        eventsMapViewController.tabBarItem.image = #imageLiteral(resourceName: "mapIcon")
        
        let journeyViewController = UINavigationController(rootViewController: JourneyViewController())
        journeyViewController.tabBarItem.image = #imageLiteral(resourceName: "journeyIcon")
        
        let settingsViewController = UINavigationController(rootViewController: SettingsViewController())
        settingsViewController.tabBarItem.image = #imageLiteral(resourceName: "settingsIcon")

        
        tabbarController.setViewControllers([eventsMapViewController, journeyViewController, settingsViewController], animated: true)
        
        return tabbarController
    }
}
