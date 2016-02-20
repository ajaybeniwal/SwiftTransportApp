//
//  SavedCardsTableViewCell.swift
//  TransitFare
//
//  Created by ajaybeniwal203 on 20/2/16.
//  Copyright © 2016 ajaybeniwal203. All rights reserved.
//

import UIKit

class SavedCardsTableViewCell: UITableViewCell {

    @IBOutlet var cardNumberLabel: UILabel!
   
    @IBOutlet var cardImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
