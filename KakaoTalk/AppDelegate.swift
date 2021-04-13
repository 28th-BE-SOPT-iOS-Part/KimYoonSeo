//
//  AppDelegate.swift
//  KakaoTalk
//
//  Created by 김윤서 on 2021/04/03.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        let viewController = LoginViewController(nibName: nil, bundle: nil) 
        navigationController.viewControllers = [viewController]
        viewController.navigationController?.navigationBar.isHidden = true
        window!.rootViewController = navigationController
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        
        return true
    }
    
    func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool {
      return extensionPointIdentifier == UIApplication.ExtensionPointIdentifier.keyboard ? false : true
    }
}

