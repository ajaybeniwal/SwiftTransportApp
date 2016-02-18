//
//  AddNewCreditCardViewController.swift
//  TransitFare
//
//  Created by ajaybeniwal303 on 3/2/16.
//  Copyright © 3016 ajaybeniwal303. All rights reserved.
//

import UIKit
import Material
import Eureka

class AddNewCreditCardViewController: FormViewController {
    
    @IBAction func cancelPopUp(sender: AnyObject) {
        self.view.endEditing(true)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form  +++=
            
            Section()
            
            
            <<< TextRow("CardNumber") {
                $0.placeholder = "Card Number"
            }
            <<< PickerInlineRow<NSDate>("Card Expiry Year") { (row : PickerInlineRow<NSDate>) -> Void in
                
                row.title = row.tag
                row.displayValueFor = {
                    guard let date = $0 else{
                        return nil
                    }
                    let year = NSCalendar.currentCalendar().component(.Year, fromDate: date)
                    return "Year \(year)"
                }
                
                row.options = []
                var date = NSDate()
                for _ in 1...10{
                    row.options.append(date)
                    date = date.dateByAddingTimeInterval(60*60*24*365)
                }
                row.value = row.options[0]
            }
            <<< PickerInlineRow<NSDate>("Card Expiry Month") { (row : PickerInlineRow<NSDate>) -> Void in
                
                row.title = row.tag
                row.displayValueFor = {
                    guard let date = $0 else{
                        return nil
                    }
                    let year = NSCalendar.currentCalendar().component(.Year, fromDate: date)
                    return "Year \(year)"
                }
                
                row.options = []
                var date = NSDate()
                for _ in 1...10{
                    row.options.append(date)
                    date = date.dateByAddingTimeInterval(60*60*24*365)
                }
                row.value = row.options[0]
            }
            <<< TextRow("CVD") {
                $0.placeholder = "CVD"
            }
            
            <<< PushRow<Country>("Country") {
                $0.title = $0.tag
                $0.options = Country.allValues
                $0.value = .USA
            }
            <<< PushRow<USAStates>("State") {
                $0.title = $0.tag
                $0.options = USAStates.allValues
                $0.value = USAStates.CA
            }
            <<< TextRow("AddressLineOne") {
                $0.placeholder = "Address Line One"
            }
            <<< TextRow("AddressLineTwo") {
                $0.placeholder = "Address Line Two"
            }
            <<< ZipCodeRow("ZipCode") {
                $0.placeholder = "Zip Code"
            }
            <<< ButtonRow() {
                $0.title = "Save New Card"
                }.onCellSelection{
                    (cell,row) in
                    let dictionary:[String:Any?] = self.form.values(includeHidden: false)
                    print(dictionary);
        }
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        self.view.endEditing(true)
    }
    
    
    
    /// Executed when the 'return' key is pressed when using the emailField.
    /*func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    (textField as! TextField).detailLabelHidden = !(0 < emailField.text?.utf16.count)
    return false
    }*/
    
}
