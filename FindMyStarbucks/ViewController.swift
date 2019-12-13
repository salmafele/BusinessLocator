//
//  ViewController.swift
//  FindMyStarbucks
//
//  Created by Salma on 12/11/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit
import GoogleMaps
        
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let camera = GMSCameraPosition.camera(withLatitude: 40.0026767, longitude: -75.2581151, zoom: 10.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 40.0026767, longitude: -75.2581151)
        marker.title = "Philadelphia"
        marker.snippet = "Pensylvania"
        marker.map = mapView

        mapView.isTrafficEnabled = true
        mapView.mapType = .normal

        view = mapView
        
        loadMcDonalds()
    }
    
    func loadMcDonalds() {

        guard let url = URL(string: "https://api.yelp.com/v3/businesses/search?term=mcdonalds&latitude=40.0026767&longitude=-75.2581151") else { return }

        var request = URLRequest(url: url)
        
        request.addValue("Bearer jhzPe8Pyf0-uMZE1zvM3ROUZBq8Z7vauFTSxf1TbwlZOcPUHCRjDA9zksocZ67RUc_BdE9a0Fy8jynh9ZuNn3p0To7zC_ecf6ZiyIWWujq0LTYGGa5QSfII1FNryXXYx", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

            guard let data = data else { return }

            print ("Data: \(String(bytes: data, encoding: .utf8)!)")

        }
        task.resume()
    }

}

