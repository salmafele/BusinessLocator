//
//  LookForBusinesses.swift
//  FindMyStarbucks
//
//  Created by Salma on 12/17/19.
//  Copyright © 2019 Salma. All rights reserved.
//

//

import UIKit

class LookForBusinesses: UIViewController {
    
    var businessData = [Business]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    func loadBusiness(userInput: String) {
        
        guard let url = URL(string: "https://api.yelp.com/v3/businesses/search?term=\(userInput)&location=atlanta") else { return }

        var request = URLRequest(url: url)

        request.addValue(ApiKeys.yelpApiKey, forHTTPHeaderField: "Authorization")
        
        
//        var urlString = URL(string: )

        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

            guard let data = data else { return }

            print ("Data: \(String(bytes: data, encoding: .utf8)!)")

            let yelpParser = YelpParser()
            yelpParser.parse(data: data) { (yelpData) in
                
            self.businessData = yelpData.businesses
                
                // get to all threads in the UI
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        task.resume()
    }
    
    // segue to detail page
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var detailView = segue.destination as? DetailViewController
//
//
//    }
}

extension LookForBusinesses:  UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businessData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "businessCell") as? BusinessCell else { return UITableViewCell() }
                
        // image, is_closed, double
        cell.businessName.text = businessData[indexPath.row].name
        print(businessData[indexPath.row].name)
        cell.priceLabel.text = businessData[indexPath.row].price
        cell.businessType.text = businessData[indexPath.row].categories![0].title // category
        cell.distanceLabel.text = businessData[indexPath.row].distance?.description
//        cell.businessIV?.image? = businessData[indexPath.row].image_url
//        cell.distanceLabel.text = businessData[indexPath.row].distance?.description // double

        
        return cell
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // to change every time a char is typed
        loadBusiness(userInput: searchText)
        
    }

}

