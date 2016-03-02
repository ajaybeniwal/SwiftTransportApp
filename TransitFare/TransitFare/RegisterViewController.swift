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
import Parse

class RegisterViewController: UIViewController {
    var backgroundImageView : UIImageView?
    var userNameTextField: UITextField?
    var phoneNumberTextField:UITextField?
    var passwordTextField:UITextField?
    var frostedView :UIView?
    var registerButton:RaisedButton?
    var isAlreadyLoggedinButton : UIButton?
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
        
        self.phoneNumberTextField = UITextField()
        self.phoneNumberTextField!.textColor = UIColor.blackColor()
        self.phoneNumberTextField!.backgroundColor = UIColor(white: 1, alpha: 0.6);
        self.phoneNumberTextField!.layer.borderWidth = 0.5
        self.phoneNumberTextField!.keyboardType = .ASCIICapable
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
            make.top.equalTo(self.userNameTextField!.snp_bottom).offset(0)
            make.centerX.equalTo(self.frostedView!)
            make.leading.equalTo(self.frostedView!)
            
            make.height.equalTo(50)
        }
        
        
        self.passwordTextField = UITextField()
        self.passwordTextField!.textColor = UIColor.blackColor()
        self.passwordTextField!.backgroundColor = UIColor(white: 1, alpha: 0.6);
        self.passwordTextField!.layer.borderWidth = 0.5
        self.passwordTextField!.keyboardType = .ASCIICapable
        self.passwordTextField!.secureTextEntry = true
        self.passwordTextField!.layer.borderColor = UIColor(white: 1, alpha: 0.8).CGColor;
        self.passwordTextField!.placeholder = "Password"
        self.passwordTextField!.clearButtonMode = .Always
        
        
        let passwordIconImage = UIImageView(image: UIImage(named: "password")!.imageWithRenderingMode(.AlwaysTemplate));
        passwordIconImage.frame = CGRectMake(30, 10, 24, 24)
        passwordIconImage.contentMode = .ScaleAspectFit
        passwordIconImage.tintColor = MaterialColor.grey.base
        
        self.passwordTextField!.leftView = passwordIconImage
        self.passwordTextField!.leftViewMode = .Always
        frostedView!.addSubview(self.passwordTextField!)
        self.passwordTextField!.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(self.phoneNumberTextField!.snp_bottom).offset(0)
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
            make.top.equalTo(self.passwordTextField!.snp_bottom).offset(20)
            make.centerX.equalTo(self.frostedView!)
            make.width.equalTo(250)
            make.height.equalTo(50)
        }
        
        self.isAlreadyLoggedinButton = UIButton()
        self.isAlreadyLoggedinButton?.setTitle("Is already logged in?", forState: .Normal)
        self.isAlreadyLoggedinButton?.addTarget(self, action: Selector("alreadyLoggedIn:"), forControlEvents: .TouchUpInside)
        self.isAlreadyLoggedinButton?.titleLabel?.textColor = UIColor.whiteColor()
        frostedView!.addSubview(self.isAlreadyLoggedinButton!)
        self.isAlreadyLoggedinButton!.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(self.registerButton!.snp_bottom).offset(20)
            make.centerX.equalTo(self.frostedView!)
            make.width.equalTo(250)
            make.height.equalTo(50)
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func alreadyLoggedIn(sender:UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func registerClick(sender:UIButton){
        //dismissViewControllerAnimated(true, completion:nil)
        let progressHUD = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        
        let user = PFUser()
        user.username = userNameTextField?.text
        user.password = passwordTextField?.text
        user.email = userNameTextField?.text
        user["phone"] = phoneNumberTextField?.text
        
        user.signUpInBackgroundWithBlock {
            (success,error) -> Void in
            progressHUD.hide(true)
            if let _ = error{
               self.showAlert("Error", message: "Error while creating user")
            }
            else{
                self.showAlertWithActionCallback("Success", message: "User created successfully", callback: { (action) -> Void in
                    self.dismissViewControllerAnimated(true, completion: nil)
                })
            }
        }
        
        
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
