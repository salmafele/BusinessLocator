//
//  FindMyStarbucksTests.swift
//  FindMyStarbucksTests
//
//  Created by Salma on 12/11/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import XCTest
@testable import FindMyStarbucks

class FindMyStarbucksTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchParser() {

         let testBundle = Bundle(for: type(of: self))
         let filename = "searchPhily"
         let path = testBundle.path(forResource: filename, ofType: "json")
         XCTAssertNotNil(path)

         guard let cleanPath = path else { return }

         let url = NSURL.fileURL(withPath: cleanPath)

         do {
             let data = try Data(contentsOf: url)
             XCTAssertNotNil(data)

             let parser = YelpParser()
            parser.parse(data: data) { (yelpData) in
                print(yelpData.businesses.count)
                XCTAssertEqual(yelpData.businesses.count, 20, "Expected 20 records, recieved: \(yelpData.businesses.count)")
                print(yelpData.region.center)
            }
         } catch {
            print ("Error: \(error.localizedDescription)")
        }
     }

}
