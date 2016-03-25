//
//  UITabBarExtension.swift
//  TransitFare
//
//  Created by Ajay Singh on 25/3/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import UIKit


extension UITabBarController{
    func redirectToSavedCardsView() -> Void{
        if let viewController = self.viewControllers?[4]{
            self.selectedViewController = viewController
            if let navController = viewController as? UINavigationController{
                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("savedCardStoryBoard") as UIViewController
                navController.pushViewController(viewController, animated: true)
            }
        }
    }
}