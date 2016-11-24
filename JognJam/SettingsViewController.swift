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
    @IBOutlet weak var onlineModeSwitch: UISwitch!
    @IBOutlet weak var musicSuggestionsSwitch: UISwitch!
    @IBOutlet weak var voiceControlSwitch: UISwitch!
    
    @IBOutlet weak var profilePictureButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        locationServicesSwitch.setOn(user.locationServices, animated: true)
        onlineModeSwitch.setOn(user.onlineMode, animated: true)
        musicSuggestionsSwitch.setOn(user.musicSuggestions, animated: true)
        voiceControlSwitch.setOn(user.voiceControl, animated: true)
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
    @IBAction func onlineModeSwitchPressed(sender: UISwitch) {
        user.setOnlineMode(!user.onlineMode)
    }
    @IBAction func musicSuggestionsSwitchPressed(sender: UISwitch) {
        user.setMusicSuggestions(!user.musicSuggestions)
    }
    @IBAction func voiceControlSwitchPressed(sender: UISwitch) {
        user.setVoiceControl(!user.voiceControl)
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
