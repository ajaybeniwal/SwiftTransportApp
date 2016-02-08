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
        let apiEndPoint:String  = "https://portal.transitfare.com/api/1/mobile/" + endPoint
        return apiEndPoint
        
    }
}