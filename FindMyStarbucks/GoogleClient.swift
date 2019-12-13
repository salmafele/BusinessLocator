//
//  GoogleClient.swift
//  FindMyStarbucks
//
//  Created by Salma on 12/12/19.
//  Copyright © 2019 Salma. All rights reserved.
//
//
//import Foundation
//import CoreLocation
//
//protocol GoogleClientRequest {
//    
//    var googlePlacesKey : String { get set }
//    func getGooglePlacesData(forKeyword keyword: String, location: CLLocation,withinMeters radius: Int, using completionHandler: @escaping (GooglePlacesResponse) -> ())
//}
//
//class GoogleClient: GoogleClientRequest {
//    
//    let session = URLSession(configuration: .default)
//    var googlePlacesKey: String = "AIzaSyDDjQO1XU3IS9vr6tdnfl-XTJ1oaxJUgo4"
//     
//    func getGooglePlacesData(forKeyword keyword: String, location: CLLocation, withinMeters radius: Int, using completionHandler: @escaping (GooglePlacesResponse) -> ())  {
//         
//        let url = googlePlacesDataURL(forKey: googlePlacesKey, location: location, keyword: keyword)
//         let task = session.dataTask(with: url) { (responseData, _, error) in
//                                                
//             if let error = error {
//                print(error.localizedDescription)
//                  return
//             }
//                                                
//             guard let data = responseData, let response = try? JSONDecoder().decode(GooglePlacesResponse.self, from: data) else {
//                  completionHandler(GooglePlacesResponse(results:[]))
//                  return
//             }
//             completionHandler(response)
//        }
//        task.resume()
//    }
//    
//    func googlePlacesDataURL(forKey apiKey: String, location: CLLocation, keyword: String) -> URL {
//    
//         let baseURL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
//         let locationString = "location=" +     String(location.coordinate.latitude) + "," + String(location.coordinate.longitude)
//         let rankby = "rankby=distance"
//         let keywrd = "keyword=" + keyword
//         let key = "key=" + apiKey
//    
//         return URL(string: baseURL + locationString + "&" + rankby + "&" + keywrd + "&" + key)!
//    }
//    
//}
