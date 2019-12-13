//
//  YelpData.swift
//  FindMyStarbucks
//
//  Created by Salma on 12/12/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import Foundation

struct YelpData: Codable {
    var businesses: [String]
}

    struct Business: Codable {
        var name: String?
        var coordinates: Coordinates
    }

        struct Coordinates: Codable {
            var latitude: Double?
            var langitude: Double?
        }
