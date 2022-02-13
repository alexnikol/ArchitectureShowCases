//
//  AppDelegate.swift
//  ArchitectureShowCases
//
//  Created by Alexander Nikolaychuk on 13.02.2022.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    public func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            window = UIWindow()
            window?.rootViewController = makeRootViewController()
            window?.makeKeyAndVisible()
        return true
    }

    private func makeRootViewController() -> UIViewController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [genres()]
        return tabBar
    }
    
    private func genres() -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        return vc
    }
}
