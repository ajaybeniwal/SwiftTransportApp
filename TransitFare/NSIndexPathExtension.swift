//
//  NSIndexPathExtension.swift
//  TransitFare
//
//  Created by Ajay Singh on 7/4/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import Foundation

extension NSIndexPath{
    func isFirstRow () ->Bool{
        return self.row == 0
    }
    func isSecondRow() ->Bool{
        return self.row == 1
    }
    func isThirdRow() ->Bool{
        return self.row == 2
    }
}