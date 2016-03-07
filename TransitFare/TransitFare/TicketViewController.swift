//
//  Ticket.swift
//  TransitFare
//
//  Created by ajaybeniwal203 on 6/3/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import UIKit
import Parse

class TicketViewController: UIViewController,UITableViewDelegate {
let globalNavigationBarHeight = 64
var tableView = UITableView()
    let dataSource = TicketDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        setUpTableView()
    }
    func setUpTableView(){
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(globalNavigationBarHeight)
            make.left.right.bottom.equalTo(0)
        }
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
        tableView.tableFooterView = UIView()
    }
}
