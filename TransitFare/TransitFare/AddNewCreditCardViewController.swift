//
//  AddNewCreditCardViewController.swift
//  TransitFare
//
//  Created by ajaybeniwal203 on 3/2/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import UIKit
import Material

class AddNewCreditCardViewController: UIViewController, TextFieldDelegate {
    private var expiryMonth: TextField!
    private var expiryYear: TextField!
    private var cvv: TextField!
    private var addressLineOne: TextField!
    private var addressLineTwo: TextField!
    private var zipCode: TextField!
    private var country: TextField!
    private var state: TextField!
    private var scrollView: UIScrollView!
    private var uiView :UIView!
    private var saveButton: RaisedButton!
    @IBAction func cancelPopUp(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareScrollView()
        prepareCardNumber()
        prepareExpiryMonth()
        prepareExpiryYear()
        prepareCVV()
        prepareState()
        prepareCountry()
        prepareAddressLineOne()
        prepareAddressLineTwo()
        prepareZipCode()
        prepareRaisedButton()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.uiView.frame.size.height);
    }
    
    func prepareScrollView(){
        scrollView = UIScrollView(frame:CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height))
        uiView = UIView(frame:CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height+200))
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(uiView)
    }
    
    func prepareCardNumber(){
        
        let creditCardNumber: TextField = TextField(frame: CGRectMake(10, 70, self.view.bounds.width-20, 24))
        creditCardNumber.placeholder = "Card Number"
        creditCardNumber.font = RobotoFont.regularWithSize(16)
        creditCardNumber.textColor = MaterialColor.black
        
        creditCardNumber.titleLabel = UILabel()
        creditCardNumber.titleLabel!.font = RobotoFont.mediumWithSize(12)
        creditCardNumber.titleLabelColor = MaterialColor.grey.lighten1
        creditCardNumber.titleLabelActiveColor = MaterialColor.blue.accent3
        creditCardNumber.clearButtonMode = .WhileEditing
        self.uiView.addSubview(creditCardNumber)
        
    }
    
    private func prepareExpiryMonth(){
        expiryMonth = TextField(frame: CGRectMake(10, 140, view.bounds.width-20, 24))
        expiryMonth.placeholder = "Expiry Month"
        expiryMonth.font = RobotoFont.regularWithSize(16)
        expiryMonth.textColor = MaterialColor.black
        
        expiryMonth.titleLabel = UILabel()
        expiryMonth.titleLabel!.font = RobotoFont.mediumWithSize(12)
        expiryMonth.titleLabelColor = MaterialColor.grey.base
        expiryMonth.titleLabelActiveColor = MaterialColor.blue.accent3
        expiryMonth.clearButtonMode = .WhileEditing
         self.uiView.addSubview(expiryMonth)
    }
    
    private func prepareExpiryYear(){
        expiryYear = TextField(frame: CGRectMake(10, 210, view.bounds.width-20, 24))
        expiryYear.placeholder = "Expiry Year"
        expiryYear.font = RobotoFont.regularWithSize(16)
        expiryYear.textColor = MaterialColor.black
        
        expiryYear.titleLabel = UILabel()
        expiryYear.titleLabel!.font = RobotoFont.mediumWithSize(12)
        expiryYear.titleLabelColor = MaterialColor.grey.base
        expiryYear.titleLabelActiveColor = MaterialColor.blue.accent3
        expiryYear.clearButtonMode = .WhileEditing
         self.uiView.addSubview(expiryYear)
    }
    
    private func prepareCVV(){
        cvv = TextField(frame: CGRectMake(10, 280, view.bounds.width-20, 24))
        cvv.placeholder = "Security Code"
        cvv.font = RobotoFont.regularWithSize(16)
        cvv.textColor = MaterialColor.black
        
        cvv.titleLabel = UILabel()
        cvv.titleLabel!.font = RobotoFont.mediumWithSize(12)
        cvv.titleLabelColor = MaterialColor.grey.base
        cvv.titleLabelActiveColor = MaterialColor.blue.accent3
        cvv.clearButtonMode = .WhileEditing
        self.uiView.addSubview(cvv)
    }
    
    func prepareState(){
        state = TextField(frame: CGRectMake(10, 350, view.bounds.width-20, 24))
        state.placeholder = "State"
        state.font = RobotoFont.regularWithSize(16)
        state.textColor = MaterialColor.black
        
        state.titleLabel = UILabel()
        state.titleLabel!.font = RobotoFont.mediumWithSize(12)
        state.titleLabelColor = MaterialColor.grey.base
        state.titleLabelActiveColor = MaterialColor.blue.accent3
        state.clearButtonMode = .WhileEditing
         self.uiView.addSubview(state)
    }
    
    func prepareCountry(){
        country = TextField(frame: CGRectMake(10, 420, view.bounds.width-20, 24))
        country.placeholder = "Country"
        country.font = RobotoFont.regularWithSize(16)
        country.textColor = MaterialColor.black
        
        country.titleLabel = UILabel()
        country.titleLabel!.font = RobotoFont.mediumWithSize(12)
        country.titleLabelColor = MaterialColor.grey.base
        country.titleLabelActiveColor = MaterialColor.blue.accent3
        country.clearButtonMode = .WhileEditing
        self.uiView.addSubview(country)
    }
    
    func prepareZipCode(){
        zipCode = TextField(frame: CGRectMake(10, 490, view.bounds.width-20, 24))
        zipCode.placeholder = "Zip Code"
        zipCode.font = RobotoFont.regularWithSize(16)
        zipCode.textColor = MaterialColor.black
        
        zipCode.titleLabel = UILabel()
        zipCode.titleLabel!.font = RobotoFont.mediumWithSize(12)
        zipCode.titleLabelColor = MaterialColor.grey.base
        zipCode.titleLabelActiveColor = MaterialColor.blue.accent3
        zipCode.clearButtonMode = .WhileEditing
        self.uiView.addSubview(zipCode)
    }
    
    func prepareAddressLineOne(){
        addressLineOne = TextField(frame: CGRectMake(10, 560, view.bounds.width-20, 24))
        addressLineOne.placeholder = "Address Line One"
        addressLineOne.font = RobotoFont.regularWithSize(16)
        addressLineOne.textColor = MaterialColor.black
        
        addressLineOne.titleLabel = UILabel()
        addressLineOne.titleLabel!.font = RobotoFont.mediumWithSize(12)
        addressLineOne.titleLabelColor = MaterialColor.grey.base
        addressLineOne.titleLabelActiveColor = MaterialColor.blue.accent3
        addressLineOne.clearButtonMode = .WhileEditing
        self.uiView.addSubview(addressLineOne)
    }
    
    func prepareAddressLineTwo(){
        addressLineTwo = TextField(frame: CGRectMake(10, 630, view.bounds.width-20, 24))
        addressLineTwo.placeholder = "Address Line Two"
        addressLineTwo.font = RobotoFont.regularWithSize(16)
        addressLineTwo.textColor = MaterialColor.black
        
        addressLineTwo.titleLabel = UILabel()
        addressLineTwo.titleLabel!.font = RobotoFont.mediumWithSize(12)
        addressLineTwo.titleLabelColor = MaterialColor.grey.base
        addressLineTwo.titleLabelActiveColor = MaterialColor.blue.accent3
        addressLineTwo.clearButtonMode = .WhileEditing
        self.uiView.addSubview(addressLineTwo)
    }
    
    func prepareRaisedButton(){
        saveButton = RaisedButton(frame: CGRectMake(10, 700, view.bounds.width-20, 65))
        saveButton.setTitle("Save", forState: .Normal)
        saveButton.backgroundColor = MaterialColor.blue.base
        saveButton.titleLabel!.font = RobotoFont.mediumWithSize(18)
        self.uiView.addSubview(saveButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /// Executed when the 'return' key is pressed when using the emailField.
    /*func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    (textField as! TextField).detailLabelHidden = !(0 < emailField.text?.utf16.count)
    return false
    }*/
    
}
