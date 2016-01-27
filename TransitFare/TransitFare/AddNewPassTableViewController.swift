//
//  AddNewPassTableViewController.swift
//  TransitFare
//
//  Created by ajaybeniwal203 on 26/1/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AddNewPassTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPassData()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    /*Fetch the product data and the credit card data from the api using alamofire */
    
    func getPassData()->Void{
        Alamofire.request(.GET, APIUtility.getEndPointURL("fareLookup")).responseJSON(completionHandler:
            {
                (response) -> Void in
                if let value = response.result.value {
                    let json = JSON(value)
                    let data = json["data"]
                    for (index,subJson):(String, JSON) in data {
                        print(index)
                        print(subJson["accountType"].string)
                    }
                    
                    
                }
                else{
                    print("error while fetching the records")
                }
            }
        )
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewPassTableCell", forIndexPath: indexPath) as! AddNewPassTableViewCell
        
        if(indexPath.section==0){
            cell.cardNumber.text = "Discout Day Pass - $1.25"
            
        }
        else{
            cell.cardNumber.text = "1233-xxxx-xxxx-x123"
        }
        
        
        
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionTitle = ""
        switch (section){
        case 0:
            sectionTitle = "Select a Mobile pass to purchase"
            break;
        case 1:
            sectionTitle = "Select a credit card"
            break;
        default:
            sectionTitle = ""
            break;
        }
        return sectionTitle
        
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath);
        if(cell?.accessoryType == UITableViewCellAccessoryType.None){
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        else{
            cell?.accessoryType = UITableViewCellAccessoryType.None
        }
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.whiteColor()
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor(red: 33.0/255.0, green: 150.0/255.0, blue: 242.0/255.0, alpha: 1.0)
        
        
    }
    
    
    
}
