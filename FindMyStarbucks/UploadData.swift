//
//  UploadData.swift
//  FindMyStarbucks
//
//  Created by Salma on 12/12/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit

class UploadData {

    let session = URLSession.shared
    let request = NSURLRequest(url: URL(string: "https://api.yelp.com/v3/businesses/search?term=mcdonalds&latitude=40.0026767&longitude=-75.2581151")! as URL)
    let dataToUpload = "Some Arbitrary Data".data(usingEncoding: NSUTF8StringEncoding)

    let uploadTask = session.uploadTaskWithRequest(request, fromData: dataToUpload,
                                            completionHandler: { (responseData, response, error) in
    })
                     
        if
        let responseData = responseData,
            responseString = String(data: responseData, encoding: NSUTF8StringEncoding) {
                print("Server Response:")
                print(responseString)
        }
        
        // Do something with the error
        if let error = error {
            print(error.localizedDescription)
        }
    })

    uploadTask.resume()

}
