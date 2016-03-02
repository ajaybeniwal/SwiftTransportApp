//
//  MoreTableViewController.swift
//  TransitFare
//
//  Created by ajaybeniwal203 on 20/2/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import UIKit
import Material
import Parse
import MBProgressHUD

class MoreTableViewController: UITableViewController {
    @IBOutlet var profileImageView: UIImageView!

    
    @IBOutlet var paymentImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        paymentImage.image = paymentImage.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        paymentImage.tintColor = MaterialColor.blue.base
        profileImageView.image = profileImageView.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        profileImageView.tintColor = MaterialColor.green.base
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    @IBAction func signOutClick(sender: AnyObject) {
        print(NSThread.isMainThread())
        let progressHUD = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            PFUser.logOut()
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                progressHUD.hide(true);
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                appDelegate.window?.rootViewController = LoginViewController()
                self.navigationController?.popToRootViewControllerAnimated(true)
            })
        }
        
            
        
            
        
     
    }

    // MARK: - Table view data source

    

   

}
