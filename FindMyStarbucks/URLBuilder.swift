//
//  URLBuilder.swift
//  FindMyStarbucks
//
//  Created by Salma on 12/12/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import Foundation

class URLBuilder {
    
        let starbucksEndpoint = "starbucks"
        let baseURL = "https://maps.googleapis.com/"
        let GET_STARBUCKS = "https://maps.googleapis.com/maps/api/place/findplacefromtext/output?parameters"
        let applicationId = "maps/"
        let apiKey = "AIzaSyDDjQO1XU3IS9vr6tdnfl-XTJ1oaxJUgo4/"
        let endpoint = "data/Users"
        
        func getloginURL() -> String {
            return baseURL + applicationId + apiKey + loginEndpoint
        }
        
        let pokimon_base_url = "https://pokeapi.co/api/v2/"
        let ditto = "pokemon/ditto/"
        
        func getDittoURL() -> String {
            return pokimon_base_url + ditto
        }
    }

}
