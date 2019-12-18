//
//  ViewController.swift
//  FindMyStarbucks
//
//  Created by Salma on 12/11/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, GMSMapViewDelegate {
    
    var mapView: GMSMapView?
        
    var phily = [
        "lat": 40.0026767,
        "lon": -75.2581151
    ]
    var seatle = [
        "lat": 47.603,
        "lon": -122.331
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        let camera = GMSCameraPosition.camera(withLatitude: phily["lat"]! , longitude: phily["lon"]!, zoom: 12.0)
        
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        mapView?.isTrafficEnabled = true
        mapView?.mapType = .normal
        mapView?.delegate = self
        
        view = mapView

        setMarker(title: "Phily", latitude: 40.0026767, longitude: -75.2581151)
//        loadBusiness()

    }


    func setMarker(title: String, latitude: Double, longitude: Double) {

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.title = title
        marker.snippet = "Pensylvania"
        marker.map = mapView

    }

//    func loadBusiness() {
//
////        guard let url = URL(string: "https://api.yelp.com/v3/businesses/search?term=mcdonalds&latitude=40.0026767&longitude=-75.2581151") else { return }
//
//    guard let url = URL(string: "https://api.yelp.com/v3/businesses/search?term=restaurants&location=atlanta") else { return }
//
//        var request = URLRequest(url: url)
//
//        request.addValue(ApiKeys.yelpApiKey, forHTTPHeaderField: "Authorization")
//
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//
//            guard let data = data else { return }
//
//            print ("Data: \(String(bytes: data, encoding: .utf8)!)")
//
//
//
//            let yelpParser = YelpParser()
//            yelpParser.parse(data: data) { (yelpData) in
//
//                let camera =  GMSCameraPosition.camera(withLatitude: (yelpData.region?.center?.latitude)! , longitude: (yelpData.region?.center?.longitude)!, zoom: 12.0)
//
//                DispatchQueue.main.async {
//
//                    self.mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//
//                    self.view = self.mapView
//                }
//
//
//                print(yelpData.businesses.count)
//
//                for business in yelpData.businesses {
//
//                    guard let name = business.name else {
//                        continue
//                    }
//
//                    guard let lat = business.coordinates?.latitude else {
//                        continue
//                    }
//
//                    guard let lon = business.coordinates?.longitude else {
//                        continue
//                    }
//                    print ("make marker")
//                    DispatchQueue.main.async {
//                        self.setMarker(title: name, latitude: lat, longitude: lon)
//
//
//                    }
//                }
//
//            }
//        }
//        task.resume()
//    }

}
