//
//  SettingsViewController.swift
//  TransitFare
//
//  Created by Ajay Singh on 8/4/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController,UITableViewDelegate {
    
    
    var tableView = UITableView(frame:CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height),style: UITableViewStyle.Grouped)
    let globalNavigationBarHeight = 64
    let dataSource = SettingsTableDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    func setUpTableView(){
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(globalNavigationBarHeight)
            make.top.equalTo(0)
            make.left.right.bottom.equalTo(0)
        }
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
