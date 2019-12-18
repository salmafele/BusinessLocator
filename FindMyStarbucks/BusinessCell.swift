//
//  BusinessCell.swift
//  FindMyStarbucks
//
//  Created by Salma on 12/16/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit

    var businessIV: String?
    var ratingIV: String?
    var businessName: String?
    var businessType: String?
    var distanceType: Double?
    var reviewsLabel: Int?
    var statusLabel: String?

class BusinessCell: UITableViewCell {
        
    var myData: YelpData!
    
    @IBOutlet weak var businessIV: UIImageView!
    @IBOutlet weak var ratingIV: UIImageView!
    
    @IBOutlet weak var businessName: UILabel!
    @IBOutlet weak var businessType: UILabel!
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
