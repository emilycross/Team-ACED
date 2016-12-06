//
//  CreateRouteViewController.swift
//  JognJam
//
//  Created by Angela Dini on 2016-12-05.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit
import CoreLocation

class CreateRouteViewController: UIViewController, CLLocationManagerDelegate {

    var user = userProfile()
    var player = musicPlayer()
    var routeNum = 0
    
    @IBOutlet weak var profilePictureButton: UIButton!
    @IBOutlet weak var startRouteButton: UIButton!
    @IBOutlet weak var saveRouteButton: UIButton!
    
    /* Used for route tracking */
    var locManager = CLLocationManager()
    var locations = [CLLocation]()
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Set up location management */
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.activityType = .Fitness
        locManager.requestAlwaysAuthorization()
        
        /* Make status bar visible */
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        /* Set profile picture image */
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    /* For location tracking:
       Called when new location update */
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for loc in locations {
            if loc.horizontalAccuracy < 20 {
                //save location
                self.locations.append(loc)
                
            }
        }
    }
    
    /* Start the route */
    @IBAction func startRoutePressed(sender: UIButton) {
        if user.routeStarted == true {
            startRouteButton.setTitle("Start Route", forState: UIControlState.Normal)
            user.routeStarted = false
            /*locations.removeAll(keepCapacity: false)
            locManager.startUpdatingLocation()*/
            saveRouteButton.hidden = false
        }
        else {
            startRouteButton.setTitle("End Route", forState: UIControlState.Normal)
            user.routeStarted = true
            //locManager.stopUpdatingLocation()
            saveRouteButton.hidden = true
        }
    }
    
    /* Created a sample route for the demo using preset location data */
    @IBAction func saveRoutePressed(sender: UIButton) {
        locations = [CLLocation(latitude: 44.6366, longitude: -63.5917), CLLocation(latitude: 44.6474, longitude: -63.5806), CLLocation(latitude: 44.6304, longitude: -63.6028), CLLocation(latitude: 44.6233, longitude: -63.5686), CLLocation(latitude: 48.0658, longitude: -66.3731)]
        user.routeLocations[0] = locations
    }

    /* Segue preparation */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "createRouteToProfile" {
            let destinationVC = segue.destinationViewController as? ProfileViewController
            self.user.routeLocations[0] = self.locations
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
            
        else if segue.identifier == "createRouteToRoutes" {
            let destinationVC = segue.destinationViewController as? RouteViewController
            self.user.routeLocations[0] = self.locations
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
        else if segue.identifier == "createRouteToLogin" {
            self.user.routeLocations[0] = self.locations
            self.user.start = true
            self.player.pause()
        }
    }
}
