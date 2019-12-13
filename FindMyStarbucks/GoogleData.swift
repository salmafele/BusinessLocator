//
//  GoogleData.swift
//  FindMyStarbucks
//
//  Created by Salma on 12/12/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps
import GooglePlaces


class GoogleData {
    
    typealias PlacesCompletion = ([Place]) -> Void

    
    private var placesTask: URLSessionDataTask?
    private var session: URLSession {
      return URLSession.shared
    }

func fetchPlacesNearCoordinate(_ coordinate: CLLocationCoordinate2D, radius: Double, types: [String], completion: @escaping PlacesCompletion) -> Void {
    var urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(coordinate.latitude),\(coordinate.longitude)&radius=\(radius)&rankby=prominence&sensor=true&key=\(GoogleApiKey.googleApiKey)"
    
  let typesString = types.count > 0 ? types.joined(separator: "|") : "cafe"
  urlString += "&types=\(typesString)"
  urlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? urlString
  
  guard let url = URL(string: urlString) else {
    completion([])
    return
  }
  
  if let task = placesTask, task.taskIdentifier > 0 && task.state == .running {
    task.cancel()
  }
  
    placesTask = session.dataTask(with: url) { data, response, error in
        var placesArray: [Place] = []
            defer {
        
                DispatchQueue.main.async {
        
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                completion(placesArray)
                
                }
            }
    }
    
    
//    let request = URLRequest(url: NSURL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/AIzaSyDDjQO1XU3IS9vr6tdnfl-XTJ1oaxJUgo4")! as URL)
//    do {
//        // Perform the request
//        var response: AutoreleasingUnsafeMutablePointer<URLResponse?>? = nil
////        let data = try NSURLConnection.sendSynchronousRequest(request, returning: response)
//
//        // Convert the data to JSON
//        let jsonSerialized = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
//
//        if let json = jsonSerialized, let url = json["url"], let explanation = json["explanation"] {
//            print(url)
//            print(explanation)
//        }
//    }
//    guard let data = data else {
//
//        return
//    }
//
//    do {
//        let json = try JSONSerialization()
//
//        let results = json["results"].arrayObject as? [[String: Any]] else {
//
//    } catch {
//        print(error)
//        }
//    }
    
    
//    results.forEach {
//      let place = GooglePlace(dictionary: $0, acceptedTypes: types)
//      placesArray.append(place)
//      if let reference = place.photoReference {
//        self.fetchPhotoFromReference(reference) { image in
//          place.photo = image
//        }
//      }
//    }
//  }
//  placesTask?.resume()
//}
}
}
