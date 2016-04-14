//
//  SettingsTableDataSource.swift
//  TransitFare
//
//  Created by Ajay Singh on 8/4/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//


import UIKit


class SettingsTableDataSource: NSObject ,UITableViewDataSource{
    
    var dataArray = [DefaultTextSwitchCell]()
    override init() {
        super.init()
        self.dataArray.append(DefaultTextSwitchCell(text: "Push Notifications"))
        self.dataArray.append(DefaultTextSwitchCell(text: "In-App-Notifications"))
        self.dataArray.append(DefaultTextSwitchCell(text: "Automatically Add Freind"))
    }
}

extension SettingsTableDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let settingCellId = "settingCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(settingCellId) as? SettingsViewCell
        if cell == nil{
            cell = SettingsViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: settingCellId)
            
        }
        cell?.configure(self.dataArray[indexPath.row])
        return cell!
    
}
}
