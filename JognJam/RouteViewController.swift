//
//  RouteViewController.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-17.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class RouteViewController: UIViewController{
    
    var user = userProfile()
    var player = musicPlayer()
    
    var routeUpTo = -1
    
    @IBOutlet weak var profilePictureButton: UIButton!
    @IBOutlet weak var route1Button: UIButton!
    @IBOutlet weak var route2Button: UIButton!
    @IBOutlet weak var route3Button: UIButton!
    @IBOutlet weak var route4Button: UIButton!
    @IBOutlet weak var route5Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Makes the status bar visible
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
        if user.routeLocations[0] == [] {
            route1Button.hidden = true
            route2Button.hidden = true
            route3Button.hidden = true
            route4Button.hidden = true
            route5Button.hidden = true
            routeUpTo = 0
        }
        else if user.routeLocations[1] == [] {
            route1Button.hidden = false
            route2Button.hidden = true
            route3Button.hidden = true
            route4Button.hidden = true
            route5Button.hidden = true
            routeUpTo = 1
        }
        else if user.routeLocations[2] == [] {
            route1Button.hidden = false
            route2Button.hidden = false
            route3Button.hidden = true
            route4Button.hidden = true
            route5Button.hidden = true
            routeUpTo = 2
        }
        else if user.routeLocations[3] == [] {
            route1Button.hidden = false
            route2Button.hidden = false
            route3Button.hidden = false
            route4Button.hidden = true
            route5Button.hidden = true
            routeUpTo = 3
        }
        else if user.routeLocations[4] == [] {
            route1Button.hidden = false
            route2Button.hidden = false
            route3Button.hidden = false
            route4Button.hidden = false
            route5Button.hidden = true
            routeUpTo = 4
        }
        else {
            route1Button.hidden = false
            route2Button.hidden = false
            route3Button.hidden = false
            route4Button.hidden = false
            route5Button.hidden = false
            routeUpTo = 5
        }
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
        else if segue.identifier == "routeToCreateRoute" {
            let destinationVC = segue.destinationViewController as? CreateRouteViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.routeNum = routeUpTo - 1
        }
        else if segue.identifier == "routeToLogin" {
            self.user.start = true
            self.player.pause()
        }
    }

}
