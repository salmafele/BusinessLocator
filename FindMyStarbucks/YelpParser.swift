//
//  YelpParser.swift
//  FindMyStarbucks
//
//  Created by Salma on 12/12/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import Foundation

class YelpParser {
    
    func parse(data: Data, completed: (YelpData) -> Void) {
        
        // create decoder
        let jsonDecoder = JSONDecoder()
        
        do {
            // decode json into structs
            let yelpData = try jsonDecoder.decode(YelpData.self, from: data)
            
            completed(yelpData)
            
        } catch {
            print("error: \(error.localizedDescription)")
        }
        
    }
    
}
