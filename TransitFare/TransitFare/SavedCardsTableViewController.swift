//
//  SavedCardsTableViewController.swift
//  TransitFare
//
//  Created by ajaybeniwal203 on 20/2/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD
import SnapKit
import Material

class SavedCardsTableViewController: UITableViewController {
    @IBOutlet var addButtonBarItem: UIBarButtonItem!
    var cardCollection = [CreditCardModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRectZero)
        let font = UIFont.boldSystemFontOfSize(18)
        addButtonBarItem.setTitleTextAttributes([NSFontAttributeName: font], forState:UIControlState.Normal)
        getCardData()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getCardData() -> Void{
        let progressHUD = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        Alamofire.request(.GET, APIUtility.getEndPointURL("billingInfo")).responseJSON(completionHandler:
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

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
         return self.cardCollection.count
    }
    @IBAction func addNewCard(sender: AnyObject) {
         self.performSegueWithIdentifier("addCardFromSavedCard", sender: sender)
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("savedCards", forIndexPath: indexPath) as! SavedCardsTableViewCell
        
        switch(self.cardCollection[indexPath.row].cardType){
        case "VI":
            cell.cardImage.image = UIImage(named: "Visa")
            break
        case "MC":
            cell.cardImage.image = UIImage(named: "MasterCard")
            break
        default:
            cell.cardImage.image = UIImage(named: "Amex")
            break
        }
        
        cell.cardNumberLabel.text = self.cardCollection[indexPath.row].cardNumber
               
        return cell;
    }

   

}
