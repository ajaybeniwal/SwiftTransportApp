//
//  DefaultTextSwitchCell.swift
//  TransitFare
//
//  Created by Ajay Singh on 8/4/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

struct DefaultTextSwitchCell :TextPresentableCell {
    var text: String
}



extension DefaultTextSwitchCell : SwitchPresentableCell {
    
    func onSwitchToggle(on:Bool){
        if on{
            print("the switch is on")
        }
        else{
            print("the switch is false")
        }
        
    }
    
}