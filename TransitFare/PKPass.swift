//
//  PKPass.swift
//  TransitFare
//
//  Created by ajaybeniwal203 on 26/2/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import Foundation
import PassKit


extension PKPass{
    func isPassAlreadyAdded() ->Bool{
        let passKitLibrary = PKPassLibrary();
        return passKitLibrary.containsPass(self)
    }
}