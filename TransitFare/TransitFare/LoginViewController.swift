//
//  LoginViewController.swift
//  TransitFare
//
//  Created by ajaybeniwal203 on 7/2/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import UIKit
import SnapKit
import MBProgressHUD
import Material

class LoginViewController: UIViewController {
    var backgroundImageView : UIImageView?
    var userNameTextField:UITextField?
    var passwordTextField:UITextField?
    var loginButton:RaisedButton?
    var frostedView :UIView?
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
        self.userNameTextField!.frame = CGRectMake(0, 100, self.view.frame.width,60)
        
        let userNameIconImageView = UIImageView(image: UIImage(named: "username")!.imageWithRenderingMode(.AlwaysTemplate));
        userNameIconImageView.frame = CGRectMake(0, 0, 32, 32)
        userNameIconImageView.contentMode = .ScaleAspectFit
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
        
        
        self.passwordTextField = UITextField()
        self.passwordTextField!.textColor = UIColor.blackColor()
        self.passwordTextField!.backgroundColor = UIColor(white: 1, alpha: 0.6);
        self.passwordTextField!.layer.borderWidth = 0.5
        self.passwordTextField!.keyboardType = .ASCIICapable
        self.passwordTextField!.secureTextEntry = true
        self.passwordTextField!.layer.borderColor = UIColor(white: 1, alpha: 0.8).CGColor;
        self.passwordTextField!.placeholder = "Password"
        self.passwordTextField!.clearButtonMode = .Always
         self.passwordTextField!.frame = CGRectMake(0, 160, self.view.frame.width,60)
        
        
        let passwordIconImageView = UIImageView(image: UIImage(named: "password")!.imageWithRenderingMode(.AlwaysTemplate));
        passwordIconImageView.frame = CGRectMake(0, 0, 34, 22)
        passwordIconImageView.contentMode = .ScaleAspectFit
       
        
        self.passwordTextField!.leftView = passwordIconImageView
        self.passwordTextField!.leftViewMode = .Always
        frostedView!.addSubview(self.passwordTextField!)
        
        self.passwordTextField!.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(self.userNameTextField!.snp_bottom).offset(0)
            make.centerX.equalTo(self.frostedView!)
            make.leading.equalTo(self.frostedView!)

            make.height.equalTo(50)
        }
        
        self.loginButton = RaisedButton(frame: CGRectMake(100, 300, 200, 45))
        self.loginButton!.setTitle("Login", forState: .Normal)
        self.loginButton!.backgroundColor = MaterialColor.pink.base
        frostedView!.addSubview(self.loginButton!)
        self.loginButton?.addTarget(self, action: Selector("loginClick:"), forControlEvents: .TouchUpInside)
        
        self.loginButton!.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(self.passwordTextField!.snp_bottom).offset(20)
            make.centerX.equalTo(self.frostedView!)
            make.width.equalTo(250)
            make.height.equalTo(50)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginClick(sender:UIButton){
        print("clicked on loginbutton")
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