//
//  Place.swift
//  FindMyStarbucks
//
//  Created by Salma on 12/12/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation
import SwiftyJSON

class Place {
  let name: String
  let address: String
  let coordinate: CLLocationCoordinate2D
  let placeType: String
  var photoReference: String?
  var photo: UIImage?
  
  init(dictionary: [String: Any], acceptedTypes: [String])
  {
    let json = JSON(dictionary)
    name = json["name"].stringValue
    address = json["vicinity"].stringValue
    
    let lat = json["geometry"]["location"]["lat"].doubleValue as CLLocationDegrees
    let lng = json["geometry"]["location"]["lng"].doubleValue as CLLocationDegrees
    coordinate = CLLocationCoordinate2DMake(lat, lng)
    
    
    var foundType = "cafe"
    let possibleTypes = acceptedTypes.count > 0 ? acceptedTypes: ["bar", ]
    
    if let types = json["types"].arrayObject as? [String] {
      for type in types {
        if possibleTypes.contains(type) {
          foundType = type
          break
        }
      }
    }
      placeType = foundType
  }
}
