//
//  TextPresentableCell.swift
//  TransitFare
//
//  Created by Ajay Singh on 8/4/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import UIKit

public protocol TextPresentableCell {
    var text : String{ get }
    var textColor :UIColor {get}
    var font :UIFont {get}
}

extension TextPresentableCell{
    
    var textColor : UIColor{
        return UIColor.blackColor()
    }
    
    var font:UIFont{
        return UIFont.systemFontOfSize(17)
    }
    
}