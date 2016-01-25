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

class FirstViewController: UIViewController {

    @IBOutlet var addIconImage: UIImageView!
    @IBOutlet var addButtonView: UIView!
    @IBOutlet var cardContainer: UIView!
    @IBOutlet var passCacheImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        passCacheImageView.kf_setImageWithURL(NSURL(string: "https://chart.googleapis.com/chart?cht=qr&chl=9871116244&choe=UTF-8&chs=280x280")!)
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
        self.addButtonView.backgroundColor = UIColor(red: 255.0/255.0, green: 64.0/255.0, blue: 129.0/255.0, alpha: 1.0)
        self.addButtonView.layer.cornerRadius = 32
        self.addIconImage.image = self.addIconImage.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        self.addIconImage.tintColor = UIColor.whiteColor()
        
       
    }


}

