//
//  BusinessCell.swift
//  FindMyStarbucks
//
//  Created by Salma on 12/16/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
        
    var myData: YelpData!
    
    @IBOutlet weak var businessName: UILabel!
    @IBOutlet weak var businessType: UILabel!
    
    @IBOutlet weak var businessIV: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
