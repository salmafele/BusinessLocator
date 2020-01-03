//
//  Networking.swift
//  FindMyStarbucks
//
//  Created by Salma on 12/20/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit

class Networking: NSObject {

    func getData(url: URL, completed: @escaping (Data) -> Void) {

            var urlRequest = URLRequest(url: url)
                urlRequest.setValue(ApiKeys.yelpApiKey, forHTTPHeaderField: "Authorization")

            let task = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in

                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }

                guard let data = data else { return }

                completed(data)
            }
            task.resume()
        }
    
}
