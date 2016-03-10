//
//  AppDelegate.swift
//  TransitFare
//
//  Created by ajaybeniwal203 on 18/1/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var deviceToken :String?
    var tabViewController :UITabBarController?
    
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
        
        if let notificationPayLoad = launchOptions?[UIApplicationLaunchOptionsRemoteNotificationKey] as? NSDictionary {
             let orderId = notificationPayLoad["orderId"] as? NSString
            print(orderId);
        }
        
        
        /* Setting the login controller as root view controler */
        let parseConfiguration = ParseClientConfiguration {
            $0.applicationId = "myAppId"
            $0.clientKey = "myAppId"
            $0.server = "https://swifttransportapp.herokuapp.com/parse"
        }
        Parse.initializeWithConfiguration(parseConfiguration)
        let currentUser = PFUser.currentUser()
        if currentUser == nil {
            self.window?.rootViewController = LoginViewController()
        }
        return true
    }
    
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        var deviceTokenChanged: String = deviceToken.description
        deviceTokenChanged = deviceTokenChanged.stringByReplacingOccurrencesOfString(" ", withString: "").stringByReplacingOccurrencesOfString("<", withString: "").stringByReplacingOccurrencesOfString(">", withString: "");
        self.deviceToken = deviceTokenChanged
        NSLog("Push Plugin register success: %@", self.deviceToken!);
        let installation = PFInstallation.currentInstallation()
        installation.setDeviceTokenFromData(deviceToken)
        installation.saveInBackground()
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        NSLog("failed to register for remote notifications:  (error)")
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject], fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        if let orderId: String = userInfo["orderId"] as? String {
            print(orderId)
        }
        
        if(application.applicationState == .Inactive){
            print("Called from background")
        }
        
        completionHandler(UIBackgroundFetchResult.NewData)
        
    }
    
    
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        print("Recived remote notification");
        NSLog("Remote Notification user info is%", userInfo)
    }
    
    func applicationWillResignActive(application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0
        
    }
    
    func applicationWillTerminate(application: UIApplication) {
        
    }
    
    
}

