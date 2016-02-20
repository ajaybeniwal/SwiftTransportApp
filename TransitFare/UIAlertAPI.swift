//
//  UIAlertAPI.swift
//  TransitFare
//
//  Created by ajaybeniwal203 on 19/2/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import UIKit
protocol ShowsAlert {}

extension UIViewController : ShowsAlert{
    func showAlert(title:String = "Error", message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        presentViewController(alertController, animated: true, completion: nil)
    }
}
