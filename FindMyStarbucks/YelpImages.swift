//
//  YelpImages.swift
//  FindMyStarbucks
//
//  Created by Salma on 12/20/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit

class YelpImages: NSObject {
        
    func yelpImages(urlString: String, imageView: UIImageView) {

        if let url = URL(string: urlString) {

            let network = Networking()

            network.getData(url: url, completed: { (data) in

                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data)
                }
            })
        }
    }
}
