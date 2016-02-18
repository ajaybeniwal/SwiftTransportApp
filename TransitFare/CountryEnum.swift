//
//  CountryEnum.swift
//  TransitFare
//
//  Created by ajaybeniwal203 on 16/2/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import Foundation

enum Country : String, CustomStringConvertible {
    case USA = "US"
    case Canada = "Canada"
    var description : String { return rawValue }
    
    static let allValues = [USA,Canada]
}

enum USAStates :String ,CustomStringConvertible{
    case CA = "CALIFORNIA"
    case AZ = "ARIZONA"
    case NY = "New York"
    var description : String { return rawValue }
    static let allValues = [CA,AZ,NY]
}

