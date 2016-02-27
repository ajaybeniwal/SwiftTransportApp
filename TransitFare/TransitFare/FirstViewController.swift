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

@available(iOS 9.0, *)
class FirstViewController: UIViewController, PKAddPassesViewControllerDelegate {
    @IBOutlet var addNewButton: FabButton!
    @IBOutlet var cardContainer: UIView!
    @IBOutlet var passCacheImageView: UIImageView!
    var addPassButton:PKAddPassButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        passCacheImageView.kf_setImageWithURL(NSURL(string: "https://chart.googleapis.com/chart?cht=qr&chl=9871116244&choe=UTF-8&chs=280x280")!)
        prepareFabButton()
        prepareAddtoWalletButton()
        self.addNewButton!.hidden = true
        
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
        let img: UIImage? = UIImage(named: "AddNew")
        addNewButton.setImage(img, forState: .Normal)
        addNewButton.setImage(img, forState: .Highlighted)
        addNewButton.tintColor = UIColor.whiteColor()
    }
    
    
    func addToWalletClick(sender:UIButton){
        let filePath = NSBundle.mainBundle().pathForResource("BoardinPass", ofType: "pkpass")
        let data = NSData(contentsOfFile: filePath!)
        let pkPass = PKPass(data: data!, error: nil)
        if(pkPass.isPassAlreadyAdded()){
            self.showAlert("Failure", message:"The pass is already added to library")
        }
        else{
            let pkPassViewController = PKAddPassesViewController(pass: pkPass)
            pkPassViewController.delegate = self;
            self.navigationController?.presentViewController(pkPassViewController, animated: true, completion: nil)
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

