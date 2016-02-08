//
//  TransitFareSetting.swift
//  TransitFare
//
//  Created by ajaybeniwal203 on 8/2/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//


import UIKit

let keyPrefix =  "me.fin.TransitFareSetting."

class TransitFareSetting: NSObject {
    static let sharedInstance = TransitFareSetting()
    private override init(){
        super.init()
    }
    
    subscript(key:String) -> String? {
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey(keyPrefix + key) as? String
        }
        set {
            NSUserDefaults.standardUserDefaults().setValue(newValue, forKey: keyPrefix + key )
        }
    }
    
    func save(){
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}

