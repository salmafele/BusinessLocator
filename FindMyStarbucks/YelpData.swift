//
//  YelpData.swift
//  FindMyStarbucks
//
//  Created by Salma on 12/12/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import Foundation

struct YelpData: Codable {
    var businesses: [Business]
//    var region: Region?
}

struct Business: Codable {
    var name: String?
//    var coordinates: Coordinates?
//    var image_url: String?
//    var is_closed: Bool?
//    var review_count: Int?
//    var categories: [Categories]?
//    var rating: Double?
//    var price: String?
//    var location: [Location]?
//    var distance: Double?
//    var display_phone: String?
}

struct Coordinates: Codable {
    var latitude: Double?
    var longitude: Double?
}

struct Region: Codable {
    var center: Coordinates?
}

struct Categories: Codable {
    var title: String?
}

struct Location: Codable {
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var zip_code: String?
    var state: String?
    var display_address: [DisplayAddress]?
}

struct DisplayAddress: Codable {
    
}
