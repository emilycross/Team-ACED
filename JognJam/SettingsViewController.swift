//
//  SettingsViewController.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-10.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var user = userProfile()
    var player = musicPlayer()
    
    @IBOutlet weak var locationServicesSwitch: UISwitch!
    @IBOutlet weak var musicSuggestionsSwitch: UISwitch!
    
    @IBOutlet weak var profilePictureButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Makes the status bar visible
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        locationServicesSwitch.setOn(user.locationServices, animated: true)
        musicSuggestionsSwitch.setOn(user.musicSuggestions, animated: true)
        // Do any additional setup after loading the view.
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    //User presses different switches, values change
    @IBAction func locationServicesSwitchPressed(sender: UISwitch) {
         user.setLocationServices(!user.locationServices)
    }
    @IBAction func musicSuggestionsSwitchPressed(sender: UISwitch) {
        user.setMusicSuggestions(!user.musicSuggestions)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "settingsToMain" {
            let destinationVC = segue.destinationViewController as? MainViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
        else if segue.identifier == "settingsToProfile" {
            let destinationVC = segue.destinationViewController as? ProfileViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.user.username = self.user.username

        }
        else if segue.identifier == "settingsToLogin" {
            self.user.start = true
            self.player.pause()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
