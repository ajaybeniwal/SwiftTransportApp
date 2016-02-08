//
//  RegisterViewController.swift
//  TransitFare
//
//  Created by ajaybeniwal203 on 7/2/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import UIKit
import SnapKit
import MBProgressHUD
import Material

class RegisterViewController: UIViewController {
    var backgroundImageView : UIImageView?
    var userNameTextField: UITextField?
    var firstNameTextField:UITextField?
    var lastNameTextField :UITextField?
    var phoneNumberTextField:UITextField?
    var passwordTextField:UITextField?
    var verifyTextField:UITextField?
    var frostedView :UIView?
    var registerButton:RaisedButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        self.backgroundImageView = UIImageView(image: UIImage(named: "background-logo.jpg"))
        self.backgroundImageView!.frame = self.view.frame
        self.backgroundImageView!.contentMode = .ScaleToFill
        self.view.addSubview(self.backgroundImageView!)
        frostedView = UIView()
        frostedView!.frame = self.view.frame
        self.view.addSubview(frostedView!)
        
        self.userNameTextField = UITextField()
        self.userNameTextField!.textColor = UIColor.blackColor()
        self.userNameTextField!.backgroundColor = UIColor(white: 1, alpha: 0.6);
        self.userNameTextField!.layer.borderWidth = 0.5
        self.userNameTextField!.keyboardType = .ASCIICapable
        self.userNameTextField!.layer.borderColor = UIColor(white: 1, alpha: 0.8).CGColor;
        self.userNameTextField!.placeholder = "UserName"
        self.userNameTextField!.clearButtonMode = .Always
        
        
        let userNameIconImageView = UIImageView(image: UIImage(named: "username")!.imageWithRenderingMode(.AlwaysTemplate));
        userNameIconImageView.frame = CGRectMake(30, 10, 24, 24)
        userNameIconImageView.contentMode = .ScaleAspectFit
        userNameIconImageView.tintColor = MaterialColor.grey.base
        self.userNameTextField!.leftView = userNameIconImageView
        self.userNameTextField!.leftViewMode = .Always
        frostedView!.addSubview(self.userNameTextField!)
        self.userNameTextField!.snp_makeConstraints{ (make) -> Void in
            make.centerX.equalTo(self.frostedView!)
            make.top.equalTo(self.frostedView!).offset(150)
            make.trailing.equalTo(self.frostedView!)
            make.leading.equalTo(self.frostedView!)
            
            make.height.equalTo(50)
        }
        
        self.firstNameTextField = UITextField()
        self.firstNameTextField!.textColor = UIColor.blackColor()
        self.firstNameTextField!.backgroundColor = UIColor(white: 1, alpha: 0.6);
        self.firstNameTextField!.layer.borderWidth = 0.5
        self.firstNameTextField!.keyboardType = .ASCIICapable
        self.firstNameTextField!.secureTextEntry = true
        self.firstNameTextField!.layer.borderColor = UIColor(white: 1, alpha: 0.8).CGColor;
        self.firstNameTextField!.placeholder = "First Name"
        self.firstNameTextField!.clearButtonMode = .Always
        
        
        
        let accountIconImageView = UIImageView(image: UIImage(named: "account")!.imageWithRenderingMode(.AlwaysTemplate));
        accountIconImageView.frame = CGRectMake(30, 10, 24, 24)
        accountIconImageView.contentMode = .ScaleAspectFit
        accountIconImageView.tintColor = MaterialColor.grey.base
        
        self.firstNameTextField!.leftView = accountIconImageView
        self.firstNameTextField!.leftViewMode = .Always
        frostedView!.addSubview(self.firstNameTextField!)
        
        self.firstNameTextField!.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(self.userNameTextField!.snp_bottom).offset(0)
            make.centerX.equalTo(self.frostedView!)
            make.leading.equalTo(self.frostedView!)
            
            make.height.equalTo(50)
        }
        
        self.lastNameTextField = UITextField()
        self.lastNameTextField!.textColor = UIColor.blackColor()
        self.lastNameTextField!.backgroundColor = UIColor(white: 1, alpha: 0.6);
        self.lastNameTextField!.layer.borderWidth = 0.5
        self.lastNameTextField!.keyboardType = .ASCIICapable
        self.lastNameTextField!.secureTextEntry = true
        self.lastNameTextField!.layer.borderColor = UIColor(white: 1, alpha: 0.8).CGColor;
        self.lastNameTextField!.placeholder = "First Name"
        self.lastNameTextField!.clearButtonMode = .Always
        
        
        
        let lastNameIconImageView = UIImageView(image: UIImage(named: "account")!.imageWithRenderingMode(.AlwaysTemplate));
        lastNameIconImageView.frame = CGRectMake(30, 10, 24, 24)
        lastNameIconImageView.contentMode = .ScaleAspectFit
        lastNameIconImageView.tintColor = MaterialColor.grey.base
        
        self.lastNameTextField!.leftView = lastNameIconImageView
        self.lastNameTextField!.leftViewMode = .Always
        frostedView!.addSubview(self.lastNameTextField!)
        
        self.lastNameTextField!.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(self.firstNameTextField!.snp_bottom).offset(0)
            make.centerX.equalTo(self.frostedView!)
            make.leading.equalTo(self.frostedView!)
            
            make.height.equalTo(50)
        }
        
        self.phoneNumberTextField = UITextField()
        self.phoneNumberTextField!.textColor = UIColor.blackColor()
        self.phoneNumberTextField!.backgroundColor = UIColor(white: 1, alpha: 0.6);
        self.phoneNumberTextField!.layer.borderWidth = 0.5
        self.phoneNumberTextField!.keyboardType = .ASCIICapable
        self.phoneNumberTextField!.secureTextEntry = true
        self.phoneNumberTextField!.layer.borderColor = UIColor(white: 1, alpha: 0.8).CGColor;
        self.phoneNumberTextField!.placeholder = "Phone Number"
        self.phoneNumberTextField!.clearButtonMode = .Always
        
        
        let phoneIconImageView = UIImageView(image: UIImage(named: "phone")!.imageWithRenderingMode(.AlwaysTemplate));
        phoneIconImageView.frame = CGRectMake(30, 10, 24, 24)
        phoneIconImageView.contentMode = .ScaleAspectFit
        phoneIconImageView.tintColor = MaterialColor.grey.base
        
        self.phoneNumberTextField!.leftView = phoneIconImageView
        self.phoneNumberTextField!.leftViewMode = .Always
        frostedView!.addSubview(self.phoneNumberTextField!)
        self.phoneNumberTextField!.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(self.lastNameTextField!.snp_bottom).offset(0)
            make.centerX.equalTo(self.frostedView!)
            make.leading.equalTo(self.frostedView!)
            
            make.height.equalTo(50)
        }
        
        
        self.registerButton = RaisedButton()
        self.registerButton!.setTitle("Register", forState: .Normal)
        self.registerButton!.backgroundColor = MaterialColor.pink.base
        self.registerButton!.alpha = 0.8
        frostedView!.addSubview(self.registerButton!)
        self.registerButton?.addTarget(self, action: Selector("registerClick:"), forControlEvents: .TouchUpInside)
        self.registerButton!.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(self.phoneNumberTextField!.snp_bottom).offset(20)
            make.centerX.equalTo(self.frostedView!)
            make.width.equalTo(250)
            make.height.equalTo(50)
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func registerClick(sender:UIButton){
        dismissViewControllerAnimated(true, completion:nil)
        print("Clicked on register button")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
