//
//  DetailViewController.swift
//  FindMyStarbucks
//
//  Created by Salma on 12/18/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit
import GoogleMaps

class DetailViewController: UIViewController {
        
    var businessData: Business?
    var businessesData = [Business]()

    @IBOutlet weak var businessName: UILabel!
    @IBOutlet weak var businessIV: UIImageView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var reviewIV: UIImageView!
    @IBOutlet weak var reviews: UILabel!
    @IBAction func bookmark(_ sender: UIButton) {
    }
    @IBAction func clicked(_ sender: Any) {
        guard let number = URL(string: businessData!.phone!) else { return }
        UIApplication.shared.open(number)
    }
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var zipCode: UILabel!
    @IBAction func writeReview(_ sender: Any) {
    }
    @IBAction func addReview(_ sender: Any) {
        
    }
    @IBOutlet weak var locationMark: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        businessDetail()
    }
    
    func businessDetail() {
        
        if let imageURL = businessData?.image_url {
            let getImage = YelpImages()
            getImage.yelpImages(urlString: imageURL, imageView: businessIV)
        }
        
        businessName.text = businessData?.name
        reviews.text = businessData?.review_count?.description
        phoneLabel.text = businessData?.display_phone?.description // buiness phone
        price.text = businessData?.price
        
        
    }

}
