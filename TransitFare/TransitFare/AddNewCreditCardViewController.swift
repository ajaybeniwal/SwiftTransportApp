//
//  AddNewCreditCardViewController.swift
//  TransitFare
//
//  Created by ajaybeniwal303 on 3/2/16.
//  Copyright © 3016 ajaybeniwal303. All rights reserved.
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
    private var  creditCardNumber: TextField!
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
        prepareZipCode()
        prepareAddressLineOne()
        prepareAddressLineTwo()
        prepareRaisedButton()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.uiView.frame.size.height);
    }
    
    func prepareScrollView(){
        scrollView = UIScrollView(frame:CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height))
        uiView = UIView(frame:CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height+300))
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(uiView)
    }
    
    func prepareCardNumber(){
        
        creditCardNumber = TextField()
        creditCardNumber.placeholder = "Card Number"
        creditCardNumber.font = RobotoFont.regularWithSize(16)
        creditCardNumber.textColor = MaterialColor.black
        
        creditCardNumber.titleLabel = UILabel()
        creditCardNumber.titleLabel!.font = RobotoFont.mediumWithSize(12)
        creditCardNumber.titleLabelColor = MaterialColor.grey.lighten1
        creditCardNumber.titleLabelActiveColor = MaterialColor.blue.accent3
        creditCardNumber.clearButtonMode = .WhileEditing
        self.uiView.addSubview(creditCardNumber)
        creditCardNumber.snp_makeConstraints{ (make) -> Void in
            make.centerX.equalTo(self.uiView!)
            make.top.equalTo(self.uiView!).offset(30)
            make.trailing.equalTo(self.uiView!).offset(-10)
            make.leading.equalTo(self.uiView!).offset(10)
            make.height.equalTo(50)
        }

    }
    
    private func prepareExpiryMonth(){
        expiryMonth = TextField()
        expiryMonth.placeholder = "Expiry Month"
        expiryMonth.font = RobotoFont.regularWithSize(16)
        expiryMonth.textColor = MaterialColor.black
        
        expiryMonth.titleLabel = UILabel()
        expiryMonth.titleLabel!.font = RobotoFont.mediumWithSize(12)
        expiryMonth.titleLabelColor = MaterialColor.grey.base
        expiryMonth.titleLabelActiveColor = MaterialColor.blue.accent3
        expiryMonth.clearButtonMode = .WhileEditing
         self.uiView.addSubview(expiryMonth)
        expiryMonth.snp_makeConstraints{ (make) -> Void in
            make.centerX.equalTo(self.uiView!)
            make.top.equalTo(self.creditCardNumber.snp_bottom).offset(30)
             make.trailing.equalTo(self.uiView!).offset(-10)
            make.leading.equalTo(self.uiView!).offset(10)
            make.height.equalTo(50)
        }
    }
    
    private func prepareExpiryYear(){
        expiryYear = TextField()
        expiryYear.placeholder = "Expiry Year"
        expiryYear.font = RobotoFont.regularWithSize(16)
        expiryYear.textColor = MaterialColor.black
        
        expiryYear.titleLabel = UILabel()
        expiryYear.titleLabel!.font = RobotoFont.mediumWithSize(12)
        expiryYear.titleLabelColor = MaterialColor.grey.base
        expiryYear.titleLabelActiveColor = MaterialColor.blue.accent3
        expiryYear.clearButtonMode = .WhileEditing
         self.uiView.addSubview(expiryYear)
        expiryYear.snp_makeConstraints{ (make) -> Void in
            make.centerX.equalTo(self.uiView!)
            make.top.equalTo(self.expiryMonth.snp_bottom).offset(30)
             make.trailing.equalTo(self.uiView!).offset(-10)
            make.leading.equalTo(self.uiView!).offset(10)
            make.height.equalTo(50)
        }
    }
    
    private func prepareCVV(){
        cvv = TextField()
        cvv.placeholder = "Security Code"
        cvv.font = RobotoFont.regularWithSize(16)
        cvv.textColor = MaterialColor.black
        
        cvv.titleLabel = UILabel()
        cvv.titleLabel!.font = RobotoFont.mediumWithSize(12)
        cvv.titleLabelColor = MaterialColor.grey.base
        cvv.titleLabelActiveColor = MaterialColor.blue.accent3
        cvv.clearButtonMode = .WhileEditing
        self.uiView.addSubview(cvv)
        cvv.snp_makeConstraints{ (make) -> Void in
            make.centerX.equalTo(self.uiView!)
            make.top.equalTo(self.expiryYear.snp_bottom).offset(30)
             make.trailing.equalTo(self.uiView!).offset(-10)
            make.leading.equalTo(self.uiView!).offset(10)
            make.height.equalTo(50)
        }
    }
    
    func prepareState(){
        state = TextField()
        state.placeholder = "State"
        state.font = RobotoFont.regularWithSize(16)
        state.textColor = MaterialColor.black
        
        state.titleLabel = UILabel()
        state.titleLabel!.font = RobotoFont.mediumWithSize(12)
        state.titleLabelColor = MaterialColor.grey.base
        state.titleLabelActiveColor = MaterialColor.blue.accent3
        state.clearButtonMode = .WhileEditing
         self.uiView.addSubview(state)
        state.snp_makeConstraints{ (make) -> Void in
            make.centerX.equalTo(self.uiView!)
            make.top.equalTo(self.cvv.snp_bottom).offset(30)
            make.trailing.equalTo(self.uiView!).offset(-10)
            make.leading.equalTo(self.uiView!).offset(10)
            make.height.equalTo(50)
        }
    }
    
    func prepareCountry(){
        country = TextField()
        country.placeholder = "Country"
        country.font = RobotoFont.regularWithSize(16)
        country.textColor = MaterialColor.black
        
        country.titleLabel = UILabel()
        country.titleLabel!.font = RobotoFont.mediumWithSize(12)
        country.titleLabelColor = MaterialColor.grey.base
        country.titleLabelActiveColor = MaterialColor.blue.accent3
        country.clearButtonMode = .WhileEditing
        self.uiView.addSubview(country)
        country.snp_makeConstraints{ (make) -> Void in
            make.centerX.equalTo(self.uiView!)
            make.top.equalTo(self.state.snp_bottom).offset(30)
            make.trailing.equalTo(self.uiView!).offset(-10)
            make.leading.equalTo(self.uiView!).offset(10)
            make.height.equalTo(50)
        }
    }
    
    func prepareZipCode(){
        zipCode = TextField()
        zipCode.placeholder = "Zip Code"
        zipCode.font = RobotoFont.regularWithSize(16)
        zipCode.textColor = MaterialColor.black
        
        zipCode.titleLabel = UILabel()
        zipCode.titleLabel!.font = RobotoFont.mediumWithSize(12)
        zipCode.titleLabelColor = MaterialColor.grey.base
        zipCode.titleLabelActiveColor = MaterialColor.blue.accent3
        zipCode.clearButtonMode = .WhileEditing
        self.uiView.addSubview(zipCode)
        zipCode.snp_makeConstraints{ (make) -> Void in
            make.centerX.equalTo(self.uiView!)
            make.top.equalTo(self.country.snp_bottom).offset(30)
            make.trailing.equalTo(self.uiView!).offset(-10)
            make.leading.equalTo(self.uiView!).offset(10)
            make.height.equalTo(50)
        }
    }
    
    func prepareAddressLineOne(){
        addressLineOne = TextField()
        addressLineOne.placeholder = "Address Line One"
        addressLineOne.font = RobotoFont.regularWithSize(16)
        addressLineOne.textColor = MaterialColor.black
        
        addressLineOne.titleLabel = UILabel()
        addressLineOne.titleLabel!.font = RobotoFont.mediumWithSize(12)
        addressLineOne.titleLabelColor = MaterialColor.grey.base
        addressLineOne.titleLabelActiveColor = MaterialColor.blue.accent3
        addressLineOne.clearButtonMode = .WhileEditing
        self.uiView.addSubview(addressLineOne)
        addressLineOne.snp_makeConstraints{ (make) -> Void in
            make.centerX.equalTo(self.uiView!)
            make.top.equalTo(self.zipCode.snp_bottom).offset(30)
            make.trailing.equalTo(self.uiView!).offset(-10)
            make.leading.equalTo(self.uiView!).offset(10)
            make.height.equalTo(50)
        }
    }
    
    func prepareAddressLineTwo(){
        addressLineTwo = TextField()
        addressLineTwo.placeholder = "Address Line Two"
        addressLineTwo.font = RobotoFont.regularWithSize(16)
        addressLineTwo.textColor = MaterialColor.black
        
        addressLineTwo.titleLabel = UILabel()
        addressLineTwo.titleLabel!.font = RobotoFont.mediumWithSize(12)
        addressLineTwo.titleLabelColor = MaterialColor.grey.base
        addressLineTwo.titleLabelActiveColor = MaterialColor.blue.accent3
        addressLineTwo.clearButtonMode = .WhileEditing
        self.uiView.addSubview(addressLineTwo)
        addressLineTwo.snp_makeConstraints{ (make) -> Void in
            make.centerX.equalTo(self.uiView!)
            make.top.equalTo(self.addressLineOne.snp_bottom).offset(30)
             make.trailing.equalTo(self.uiView!).offset(-10)
            make.leading.equalTo(self.uiView!).offset(10)
            make.height.equalTo(50)
        }
    }
    
    func prepareRaisedButton(){
        saveButton = RaisedButton()
        saveButton.setTitle("Save", forState: .Normal)
        saveButton.backgroundColor = MaterialColor.blue.base
        saveButton.titleLabel!.font = RobotoFont.mediumWithSize(18)
        self.uiView.addSubview(saveButton)
        saveButton.snp_makeConstraints{ (make) -> Void in
            make.centerX.equalTo(self.uiView!)
            make.top.equalTo(self.addressLineTwo.snp_bottom).offset(30)
            make.trailing.equalTo(self.uiView!).offset(-10)
            make.leading.equalTo(self.uiView!).offset(10)
            make.height.equalTo(50)
        }
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
