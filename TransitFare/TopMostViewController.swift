//
//  TopMostViewController.swift
//  TransitFare
//
//  Created by ajaybeniwal203 on 24/2/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import UIKit

extension UIViewController{
    class func topMostViewController() -> UIViewController?{
      let rootViewController = UIApplication.sharedApplication().keyWindow?.rootViewController
         return self.topMostViewControllerOfViewController(rootViewController)
    }
    
    class func topMostViewControllerOfViewController(viewController: UIViewController?) -> UIViewController? {
        // UITabBarController
        if let tabBarController = viewController as? UITabBarController,
            let selectedViewController = tabBarController.selectedViewController {
                return self.topMostViewControllerOfViewController(selectedViewController)
        }
        
        // UINavigationController
        if let navigationController = viewController as? UINavigationController,
            let visibleViewController = navigationController.visibleViewController {
                return self.topMostViewControllerOfViewController(visibleViewController)
        }
        
        // presented view controller
        if let presentedViewController = viewController?.presentedViewController {
            return self.topMostViewControllerOfViewController(presentedViewController)
        }
        
        return viewController
    }
}


