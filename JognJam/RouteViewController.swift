//
//  RouteViewController.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-17.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class RouteViewController: UIViewController{
    
    /* Maintain user and music player */
    var user = userProfile()
    var player = musicPlayer()
    
    @IBOutlet weak var profilePictureButton: UIButton!
    @IBOutlet weak var route1Button: UIButton!
    @IBOutlet weak var route2Button: UIButton!
    @IBOutlet weak var route3Button: UIButton!
    @IBOutlet weak var route4Button: UIButton!
    @IBOutlet weak var route5Button: UIButton!
    
    /* Keeps track of how many routes there are */
    var routeUpTo = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Make status bar visible */
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        /* Update profile picture */
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
        
        /* Set how many routes are made and display buttons accordingly */
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
    }
    
    /* Segue preparation */
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
            destinationVC?.routeNum = routeUpTo
        }
            
        else if segue.identifier == "routeToLogin" {
            self.user.start = true
            self.player.pause()
        }
    }
}
