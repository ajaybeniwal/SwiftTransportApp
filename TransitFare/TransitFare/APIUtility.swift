//
//  APIUtility.swift
//  TransitFare
//
//  Created by ajaybeniwal203 on 26/1/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import Foundation

struct APIUtility {
    static func getEndPointURL(endPoint:String) -> String{
        let apiEndPoint:String  = "http://private-f7d564-transitfareapi.apiary-mock.com/" + endPoint
        return apiEndPoint
        
    }
}