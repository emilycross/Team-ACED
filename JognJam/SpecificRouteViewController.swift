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
    var player = musicPlayer()
    var routeNumber = 0

    @IBOutlet weak var routeNumberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Makes the status bar visible
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        routeNumberLabel.text = "Route " + String(routeNumber)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "specificRouteToRoute" {
            let destinationVC = segue.destinationViewController as? RouteViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
        else if segue.identifier == "specificRouteToProfile" {
            let destinationVC = segue.destinationViewController as? RouteViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
        else if segue.identifier == "specificRouteToLogin" {
            self.player.pause()
        }
        
    }

}
