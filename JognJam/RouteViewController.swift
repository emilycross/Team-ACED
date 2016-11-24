//
//  RouteViewController.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-17.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class RouteViewController: UIViewController {
    
    var user = userProfile()
    var player = musicPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "routeToProfile" {
            let destinationVC = segue.destinationViewController as? ProfileViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
        
        else if segue.identifier == "routeOneToDetails" {
            let destinationVC = segue.destinationViewController as? SpecificRouteViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.routeNumber = 1
        }
            
        else if segue.identifier == "routeTwoToDetails" {
            let destinationVC = segue.destinationViewController as? SpecificRouteViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.routeNumber = 2
        }
            
        else if segue.identifier == "routeThreeToDetails" {
            let destinationVC = segue.destinationViewController as? SpecificRouteViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.routeNumber = 3
        }
            
        else if segue.identifier == "routeFourToDetails" {
            let destinationVC = segue.destinationViewController as? SpecificRouteViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.routeNumber = 4
        }
            
        else if segue.identifier == "routeFiveToDetails" {
            let destinationVC = segue.destinationViewController as? SpecificRouteViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.routeNumber = 5
        }
    }

}
