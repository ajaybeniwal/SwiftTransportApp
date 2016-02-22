//
//  TransitFareClientSetting.swift
//  TransitFare
//
//  Created by ajaybeniwal203 on 8/2/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import Alamofire
import Parse

let kUserName = "me.fin.username"

class TransitFareClient: NSObject {
    static let sharedInstance = TransitFareClient()
    dynamic var username:String?
    private override init() {
        super.init()
        self.setupInMainThread()
    }
    func setupInMainThread() {
        if NSThread.isMainThread() {
            self.setup()
        }
        else {
            dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                self.setup()
            })
        }
    }
    func setup(){
        self.username = TransitFareSetting.sharedInstance[kUserName]
    }
    
    
    
    func loginOut() {
        removeAllCookies()
    }
    
    func logout(){
        PFUser.logOut()
    }
    
    /**
     remove all cookies
     */
    func removeAllCookies() {
        let storage = NSHTTPCookieStorage.sharedHTTPCookieStorage()
        if let cookies = storage.cookies {
            for cookie in cookies {
                storage.deleteCookie(cookie)
            }
        }
    }
    /**
     print all cookies
     */
    func printAllCookies(){
        let storage = NSHTTPCookieStorage.sharedHTTPCookieStorage()
        if let cookies = storage.cookies {
            for cookie in cookies {
                NSLog("name:%@ , value:%@ \n", cookie.name,cookie.value)
            }
        }
    }

}