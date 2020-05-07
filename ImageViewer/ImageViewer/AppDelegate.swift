//
//  AppDelegate.swift
//  ImageViewer
//
//  Created by gheorghe.tirnovan on 5/6/20.
//  Copyright © 2020 gheorghe.tirnovan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow()
        let navigationController = UINavigationController(rootViewController: MainViewController())
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
        return true
    }
    
}

