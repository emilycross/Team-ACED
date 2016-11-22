//
//  RouteViewController.swift
//  JognJam
//
//  Created by Emily Cross on 2016-11-17.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class RouteViewController: UIViewController {

    
    var user = userProfile()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "routeOneToDetails" {
            let destinationVC = segue.destinationViewController as? SpecificRouteViewController
            destinationVC?.user = self.user
            destinationVC?.routeNumber = 1
        }
            
        else if segue.identifier == "routeTwoToDetails" {
            let destinationVC = segue.destinationViewController as? SpecificRouteViewController
            destinationVC?.user = self.user
            destinationVC?.routeNumber = 2
        }
            
        else if segue.identifier == "routeThreeToDetails" {
            let destinationVC = segue.destinationViewController as? SpecificRouteViewController
            destinationVC?.user = self.user
            destinationVC?.routeNumber = 3
        }
            
        else if segue.identifier == "routeFourToDetails" {
            let destinationVC = segue.destinationViewController as? SpecificRouteViewController
            destinationVC?.user = self.user
            destinationVC?.routeNumber = 4
        }
            
        else if segue.identifier == "routeFiveToDetails" {
            let destinationVC = segue.destinationViewController as? SpecificRouteViewController
            destinationVC?.user = self.user
            destinationVC?.routeNumber = 5
        }
    }

}
