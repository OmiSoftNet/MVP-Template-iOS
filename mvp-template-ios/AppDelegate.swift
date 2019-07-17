//
//  AppDelegate.swift
//  NewspapersDemoApp
//
//  Created by Руслан Федорович on 7/5/19.
//  Copyright © 2019 Руслан Федорович. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        WindowRouter(window: self.window).openScreen(.navigation, fromStoryboard: .main)
        return true
    }
}

