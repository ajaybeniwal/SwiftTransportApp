//
//  FirstViewController.swift
//  TransitFare
//
//  Created by ajaybeniwal203 on 18/1/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import UIKit
import Kingfisher
import QuartzCore
import Material
import PassKit
import SnapKit
import MBProgressHUD
import Alamofire

@available(iOS 9.0, *)
class FirstViewController: UIViewController, PKAddPassesViewControllerDelegate {
    @IBOutlet var addNewButton: FabButton!
    @IBOutlet var cardContainer: UIView!
    @IBOutlet var passCacheImageView: UIImageView!
    var addPassButton:PKAddPassButton!
    var addNewPassButton :FabButton!
    var addNewCreditCardButton:FabButton!
    var isMenuOpen:Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        passCacheImageView.kf_setImageWithURL(NSURL(string: "https://chart.googleapis.com/chart?cht=qr&chl=9871116244&choe=UTF-8&chs=280x280")!)
        prepareFabButton()
        prepareAddtoWalletButton()
        prepareAddNewPassButton()
        prepareAddNewCreditCardButton()
        self.addNewButton!.hidden = false
        isMenuOpen = false;
    }
    
    func prepareAddNewPassButton(){
        let img: UIImage? = UIImage(named: "Wallet")
        addNewPassButton = FabButton()
        addNewPassButton.setImage(img, forState: .Normal)
        addNewPassButton.setImage(img, forState: .Highlighted)
        addNewPassButton.tintColor = UIColor.whiteColor()
         addNewPassButton.backgroundColor = MaterialColor.pink.base
        addNewPassButton.hidden = true
        addNewPassButton.alpha = 0
        // Add button to UIViewController.
        view.addSubview(addNewPassButton)
        
        self.addNewPassButton!.snp_makeConstraints{ (make) -> Void in
            make.width.equalTo(48)
            make.height.equalTo(48)
            make.trailing.equalTo(self.addNewButton.snp_leading).offset(-128)
            
            make.bottom.equalTo(self.addNewButton.snp_bottom)
            
        }
        
        
        addNewPassButton.addTarget(self, action: "addNewPass:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    
    func addNewPass(sender:UIButton){
        self.tabBarController?.selectedIndex = 1;
    }
    
    func prepareAddNewCreditCardButton(){
        let img: UIImage? = UIImage(named: "creditcard")
        addNewCreditCardButton = FabButton()
        addNewCreditCardButton.setImage(img, forState: .Normal)
        addNewCreditCardButton.setImage(img, forState: .Highlighted)
        addNewCreditCardButton.tintColor = UIColor.whiteColor()
         addNewCreditCardButton.backgroundColor = MaterialColor.pink.base
        addNewCreditCardButton.hidden = true
        addNewCreditCardButton.alpha = 0
        view.addSubview(addNewCreditCardButton)
        
        self.addNewCreditCardButton!.snp_makeConstraints{ (make) -> Void in
           make.width.equalTo(48)
           make.height.equalTo(48)
           make.trailing.equalTo(self.addNewButton.snp_leading).offset(-40)
            
           make.bottom.equalTo(self.addNewButton.snp_bottom)
            
        }
        
        addNewCreditCardButton.addTarget(self, action: "addNewCreditCard:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
    }
    
    
    func addNewCreditCard(sender:UIButton){
        self.performSegueWithIdentifier("presentCardFromPass", sender: sender)
   }
    
    func prepareAddtoWalletButton(){
        addPassButton = PKAddPassButton()
        self.view.addSubview(addPassButton)
        
        self.addPassButton!.snp_makeConstraints{ (make) -> Void in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.cardContainer!.snp_bottom).offset(30)
            make.leading.equalTo(self.view).offset(24)
            make.trailing.equalTo(self.view).offset(-24)
            
        }
        self.addPassButton?.addTarget(self, action: Selector("addToWalletClick:"), forControlEvents: .TouchUpInside)
        
        
        
    }
    func prepareFabButton() {
        addNewButton.backgroundColor = MaterialColor.pink.base
        let img: UIImage? = UIImage(named: "addpass")
        addNewButton.setImage(img, forState: .Normal)
        addNewButton.setImage(img, forState: .Highlighted)
        addNewButton.tintColor = UIColor.whiteColor()
        addNewButton.addTarget(self, action: "addNewButtonClick:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    
    func addNewButtonClick(sender:UIButton){
     self.addNewButton.animate(MaterialAnimation.rotate(angle: 1/8))
     
        let duration = 0.3
        let delay = 0.0
        let options = UIViewKeyframeAnimationOptions.CalculationModeLinear
        if(!isMenuOpen!){
            addNewPassButton.hidden = false;
            addNewCreditCardButton.hidden = false;
            UIView.animateKeyframesWithDuration(duration, delay: delay, options: options, animations: {
                () -> Void in
                
                
                UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 1/2, animations: {
                    self.addNewPassButton.transform = CGAffineTransformMakeScale(1.1, 1.1)
                    self.addNewPassButton.alpha = 0.6
                    self.addNewCreditCardButton.transform = CGAffineTransformMakeScale(1.1, 1.1)
                    self.addNewCreditCardButton.alpha = 0.6
                    
                })
                
                UIView.addKeyframeWithRelativeStartTime(1/2, relativeDuration: 1/2, animations: {
                    self.addNewCreditCardButton.alpha = 1
                    self.addNewPassButton.alpha = 1
                    self.addNewCreditCardButton.transform = CGAffineTransformMakeScale(1,1)
                    self.addNewPassButton.transform = CGAffineTransformMakeScale(1,1)
                    
                })
                
                }, completion: {finished in
                    // any code entered here will be applied
                    // once the animation has completed
                    
            })
            isMenuOpen = !isMenuOpen!
        }
        else{
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                
                self.addNewPassButton.alpha = 0
               self.addNewCreditCardButton.alpha = 0
              
                }, completion: {
                    (complete) -> Void in
                    self.addNewPassButton.hidden = true;
                    self.addNewCreditCardButton.hidden = true;
            })
            isMenuOpen = !isMenuOpen!
        }
       
    
        
    }
    
    
    func addToWalletClick(sender:UIButton){
        
        let progressHUD = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        let passDownloadURL = "https://walletpass.herokuapp.com/v1/passes/123/245"
        
        Alamofire.request(.GET, passDownloadURL).responseData{
            (response) -> Void in
            progressHUD.hide(true)
            if let passValue = response.result.value{
                let pkPass = PKPass(data: passValue, error: nil)
                if(pkPass.isPassAlreadyAdded()){
                    self.showAlert("Failure", message:"The pass is already added to library")
                }
                else{
                    let pkPassViewController = PKAddPassesViewController(pass: pkPass)
                    pkPassViewController.delegate = self;
                    self.navigationController?.presentViewController(pkPassViewController, animated: true, completion: nil)
                    
                }
            }
            else{
                print("error while fetching the url contents")
            }
            
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        
        self.view.backgroundColor = UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0)
        self.cardContainer.layer.masksToBounds = false
        self.cardContainer.layer.shadowColor = UIColor.blackColor().CGColor
        self.cardContainer.layer.shadowOffset = CGSizeMake(2,2);
        self.cardContainer.layer.cornerRadius = 4
        self.cardContainer.layer.shadowOpacity = 0.5
        self.cardContainer.layer.shadowRadius = 2
    }
    
    @IBAction func addButtonClick(sender: AnyObject) {
        
    }
    
    
}

