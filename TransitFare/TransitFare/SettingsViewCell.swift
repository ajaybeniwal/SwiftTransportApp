//
//  SettingsViewCell.swift
//  TransitFare
//
//  Created by Ajay Singh on 8/4/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import UIKit

class SettingsViewCell : UITableViewCell{
    
    var desriptionLabel : UILabel!
    var cellSwitch :UISwitch!
    private var delegate: SwitchWithTextViewPresentable?
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setSubviews(){
        desriptionLabel = UILabel()
        desriptionLabel.sizeToFit()
        contentView.addSubview(desriptionLabel)
        desriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        desriptionLabel.leadingAnchor.constraintEqualToAnchor(contentView.leadingAnchor,constant: 15).active = true
        
        desriptionLabel.topAnchor.constraintEqualToAnchor(contentView.topAnchor,constant: 10).active = true
        
        cellSwitch = UISwitch()
        contentView.addSubview(cellSwitch)
        // Addding class to add layout programatically instead of snapkit
     
        cellSwitch.translatesAutoresizingMaskIntoConstraints = false
        cellSwitch.trailingAnchor.constraintEqualToAnchor(contentView.trailingAnchor,constant: -15).active = true
        cellSwitch.topAnchor.constraintEqualToAnchor(contentView.topAnchor,constant: 10).active = true
        
     
        
    }
    func configure(presenter :SwitchWithTextViewPresentable){
       delegate = presenter
       desriptionLabel.text = delegate?.text
       desriptionLabel.font = delegate?.font
       desriptionLabel.textColor = delegate?.textColor
       cellSwitch.on = presenter.switchOn
       cellSwitch.onTintColor = presenter.switchColor
    }
    
}
