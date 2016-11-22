//
//  SpecificRouteViewController.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-17.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class SpecificRouteViewController: UIViewController {
    
    var user = userProfile()
    var routeNumber = 0

    @IBOutlet weak var routeNumberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        routeNumberLabel.text = "Route " + String(routeNumber)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
