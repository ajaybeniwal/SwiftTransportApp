//
//  AppDelegate.swift
//  TransitFare
//
//  Created by ajaybeniwal203 on 18/1/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let textAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        UINavigationBar.appearance().tintColor =  UIColor.whiteColor()
        UINavigationBar.appearance().barTintColor = UIColor(red: 33.0/255.0, green: 150.0/255.0, blue: 242.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().barStyle = UIBarStyle.Black
        
        let types = UIUserNotificationSettings(forTypes: [.Alert, .Badge],categories: nil)
        
          UIApplication.sharedApplication().registerUserNotificationSettings(types)
          UIApplication.sharedApplication().registerForRemoteNotifications()
        
        
        return true
    }
    
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        
        NSLog("Push Plugin register success: %@", deviceToken.description);
        let aString: String = deviceToken.description
        let newString = aString.stringByReplacingOccurrencesOfString(" ", withString: "").stringByReplacingOccurrencesOfString("<", withString: "").stringByReplacingOccurrencesOfString(">", withString: "");
        NSLog("Push Plugin register success: %@", newString);
        
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        NSLog("failed to register for remote notifications:  (error)")
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

