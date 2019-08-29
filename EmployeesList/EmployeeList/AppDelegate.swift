//
//  AppDelegate.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/27/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    setupWindow()
    startMainFlow()

    return true
  }

  private func setupWindow() {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
  }

  private func startMainFlow() {

    let firstViewController = EmployeeListViewController()
    let navigationViewController = UINavigationController(rootViewController: firstViewController)
    navigationViewController.isNavigationBarHidden = true

    window?.rootViewController = navigationViewController
  }
}

