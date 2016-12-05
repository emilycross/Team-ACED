//
//  userProfile.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-12.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import Foundation
import UIKit
import CoreMotion //for step tracker, tutorial from http://shrikar.com/ios-swift-development-step-counter-app-using-pedometer-data/
//http://pinkstone.co.uk/how-to-access-the-step-counter-and-pedometer-data-in-ios-9/



//class that holds information for each user's profile
class userProfile {
    //var routes
    //var playlists
    var username = "" //example, change later **
    var picture = UIImage(named: "Logo2_Square.png") //picture used for profile picture
    var numberSteps = 0
    
    var start = true
    
    var currentLocation = "" //for suggestions
    var currentSongTitle = ""
    var currentSongArtist = ""
    var currentSongGenre = ""
    var currentSongIndex = -1
    var currentSongSpeed = 0
    
    //For step tracking
    var pedometer = CMPedometer()
    
    //Settings
    var locationServices = true
    var musicSuggestions = true
    
    func setLocationServices(locS: Bool) {
        locationServices = locS
    }
    func setMusicSuggestions(musS: Bool) {
        musicSuggestions = musS
    }
    
    func startTracking() {
        pedometer.startPedometerUpdatesFromDate(NSDate(), withHandler: {(data, error) -> Void in
            if error != nil {
                print("There was an error requesting data from the pedometer")
            }
            else {
                dispatch_async(dispatch_get_main_queue(), {
                    self.numberSteps = Int(data!.numberOfSteps)
                })
            }
        })
    }
}