//
//  InterfaceController.swift
//  BusinessLocatorWatch Extension
//
//  Created by Salma on 12/31/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    var businessData: Business?

    @IBAction func findPlaces() {
        pushController(withName: "business", context: .none)
    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
