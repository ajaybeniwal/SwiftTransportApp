//
//  TicketViewCell.swift
//  TransitFare
//
//  Created by ajaybeniwal203 on 6/3/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import UIKit
import SnapKit

class TicketViewCell: UITableViewCell {
    var sourceDestinationLabel: UILabel!
    var ticketDescriptionLabel : UILabel!
    var tripDirectionImage: UIImageView!
    var destinationStationLabel: UILabel!
    var priceLabel :UILabel!
    var statusLabel  : UILabel!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSubviews(){
        sourceDestinationLabel = UILabel()
        sourceDestinationLabel.font = UIFont.systemFontOfSize(16)
        sourceDestinationLabel.textColor = UIColor.blackColor()
        sourceDestinationLabel.sizeToFit()
        contentView.addSubview(sourceDestinationLabel)
        sourceDestinationLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(contentView).offset(10)
            make.leading.equalTo(contentView).offset(15)
        }
        
        
        tripDirectionImage = UIImageView()
        tripDirectionImage.image = UIImage(named: "tripdirection")
        contentView.addSubview(tripDirectionImage)
        tripDirectionImage.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(24)
            make.height.equalTo(24)
            make.top.equalTo(contentView).offset(10)
            make.leading.equalTo(sourceDestinationLabel.snp_trailing).offset(15)
        }
        
        destinationStationLabel = UILabel()
        destinationStationLabel.font = UIFont.systemFontOfSize(16)
        destinationStationLabel.textColor = UIColor.blackColor()
        destinationStationLabel.sizeToFit()
        contentView.addSubview(destinationStationLabel)
        destinationStationLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(contentView).offset(10)
            make.leading.equalTo(tripDirectionImage.snp_trailing).offset(15)
        }
        
        
        
        statusLabel = UILabel()
        statusLabel.font = UIFont.systemFontOfSize(14)
        statusLabel.textColor = UIColor.lightGrayColor()
        statusLabel.sizeToFit()
        contentView.addSubview(statusLabel)
        statusLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.sourceDestinationLabel.snp_bottom).offset(10)
            make.leading.equalTo(contentView).offset(15)
            
        }
        
        
        priceLabel = UILabel()
        priceLabel.font = UIFont.systemFontOfSize(14)
        priceLabel.textColor = UIColor.lightGrayColor()
        priceLabel.sizeToFit()
        contentView.addSubview(priceLabel)
        priceLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.sourceDestinationLabel.snp_bottom).offset(10)
            make.trailing.equalTo(contentView).offset(-15)
        }
        
        ticketDescriptionLabel = UILabel()
        ticketDescriptionLabel.font = UIFont.systemFontOfSize(14)
        ticketDescriptionLabel.textColor = UIColor.lightGrayColor()
        ticketDescriptionLabel.sizeToFit()
        contentView.addSubview(ticketDescriptionLabel)
        ticketDescriptionLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.statusLabel.snp_bottom).offset(10)
            make.leading.equalTo(contentView).offset(15)
            make.bottom.equalTo(contentView).offset(-10)
        }
    }
    
}
