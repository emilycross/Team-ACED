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
    
    //For route tracking
    var locManager = CLLocationManager()
    var locations = [CLLocation]()
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.activityType = .Fitness
        locManager.requestAlwaysAuthorization()
        
         UIApplication.sharedApplication().statusBarStyle = .LightContent
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //For location tracking
    
    //Called when new location update
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for loc in locations {
            if loc.horizontalAccuracy < 20 {
                //save location
                self.locations.append(loc)
                
            }
        }
    }
    
    @IBAction func startRoutePressed(sender: UIButton) {
        if user.routeStarted == true {
            startRouteButton.setTitle("Start Route", forState: UIControlState.Normal)
            user.routeStarted = false
            locations.removeAll(keepCapacity: false)
            locManager.startUpdatingLocation()
            saveRouteButton.hidden = false
        }
        else {
            startRouteButton.setTitle("End Route", forState: UIControlState.Normal)
            user.routeStarted = true
            locManager.stopUpdatingLocation()
            saveRouteButton.hidden = true
        }
    }
    @IBAction func saveRoutePressed(sender: UIButton) {
        user.routeLocations[routeNum] = locations
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "createRouteToProfile" {
            let destinationVC = segue.destinationViewController as? ProfileViewController
            self.user.routeLocations[routeNum] = self.locations
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC
        }
            
        else if segue.identifier == "createRouteToRoutes" {
            let destinationVC = segue.destinationViewController as? RouteViewController
            self.user.routeLocations[routeNum] = self.locations
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
        else if segue.identifier == "createRouteToLogin" {
            self.user.routeLocations[routeNum] = self.locations
            self.user.start = true
            self.player.pause()
        }
    }
}
