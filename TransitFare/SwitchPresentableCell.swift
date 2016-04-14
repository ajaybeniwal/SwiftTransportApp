//
//  SwitchPresentableCell.swift
//  TransitFare
//
//  Created by Ajay Singh on 8/4/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import UIKit

public protocol SwitchPresentableCell {
    var switchOn : Bool{ get }
    var switchColor :UIColor {get}
    func onSwitchToggle(on:Bool)
}

extension SwitchPresentableCell{
    var switchOn :Bool {return true }
    var switchColor :UIColor{
        return UIColor.greenColor()
    }
}