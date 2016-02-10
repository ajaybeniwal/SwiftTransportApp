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
import MBProgressHUD
import SnapKit
import Material

class AddNewPassTableViewController: UITableViewController {
    var productCollection = [ProductModel]()
    @IBOutlet var saveBarItem: UIBarButtonItem!
    @IBAction func saveNewPass(sender: AnyObject) {
        print("clicked on save button")
       
    }
    
   
    var cardCollection = [CreditCardModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 160.0
        getPassData()
        getCardData()
        let font = UIFont.boldSystemFontOfSize(18)
        saveBarItem.setTitleTextAttributes([NSFontAttributeName: font], forState:UIControlState.Normal)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
     /*Fetch the credit card data using alamofire */
    
    func getCardData() -> Void{
        let progressHUD = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        Alamofire.request(.GET, APIUtility.getEndPointURL("customer/billingInfo")).responseJSON(completionHandler:
            {
                (response) -> Void in
                if let value = response.result.value {
                    let json = JSON(value)
                    let data = json["data"]
                    for (_,subJson):(String, JSON) in data {
                        let _cardModel = CreditCardModel(customerCode:subJson["customerCode"].string!,
                            cardNumber:subJson["card"]["number"].string!,cardType:subJson["card"]["card_type"].string!)
                        self.cardCollection.append(_cardModel)
                        
                    }
                    self.tableView.reloadData()
                    progressHUD.hide(true)
                    
                }
                else{
                    print("error while fetching the records")
                    progressHUD.hide(true)
                }
            }
        )
        
    }
    
    /*Fetch the product data and the credit card data from the api using alamofire */
    
    func getPassData()->Void{
        Alamofire.request(.GET, APIUtility.getEndPointURL("fareLookup")).responseJSON(completionHandler:
            {
                (response) -> Void in
                if let value = response.result.value {
                    let json = JSON(value)
                    let data = json["data"]
                    for (_,subJson):(String, JSON) in data {
                        let _productModel = ProductModel(id:subJson["_id"].string!,productName:subJson["optionName"].string! +  "-" + String(subJson["basePrice"].number!))
                        self.productCollection.append(_productModel)
                        
                    }
                    self.tableView.reloadData()
                    
                    
                }
                else{
                   
                    print("error while fetching the records")
                }
            }
        )
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return self.productCollection.count
        }
        else if(section==1){
            return self.cardCollection.count
        }
        
        return 1
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewPassTableCell", forIndexPath: indexPath) as! AddNewPassTableViewCell
        cell.tapNewCreditCard = {(user) in
             self.performSegueWithIdentifier("addCardFromPass", sender: user)
        }
        
        if(indexPath.section==0){
            cell.cardNumber.text = self.productCollection[indexPath.row].productName
            cell.cardTypeView.hidden = true
            cell.cardImageLeft.constant=0
            cell.cardNumberLeft.constant=16
            cell.cardNumber.hidden = false;
            cell.addNewCardButton.hidden = true
        }
        else if (indexPath.section==1){
            switch(self.cardCollection[indexPath.row].cardType){
                case "VI":
                cell.cardTypeView.image = UIImage(named: "Visa")
                break
                case "MC":
                cell.cardTypeView.image = UIImage(named: "MasterCard")
                break
                default:
                cell.cardTypeView.image = UIImage(named: "Amex")
                break
            }
            cell.cardNumber.hidden = false;
            cell.cardNumber.text = self.cardCollection[indexPath.row].cardNumber
            cell.cardTypeView.hidden = false
            cell.cardImageLeft.constant=15
            cell.cardNumberLeft.constant=98
            cell.addNewCardButton.hidden = true
        }
        else if(indexPath.section==2){
              cell.cardTypeView.hidden = true
              cell.cardNumber.hidden = true
              cell.cardImageLeft.constant = 0
              cell.cardNumberLeft.constant = 0
              cell.addNewCardButton.hidden = false
              cell.addCardLeft.constant = 15
            
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
            sectionTitle = "0"
            break;
        }
        return sectionTitle
        
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section==2){
            return 0
        }
        else{
            return 44
        }
        
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
