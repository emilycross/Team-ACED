//
//  SettingsViewController.swift
//  JognJam
//
//  Created by Angela Dini on 2016-11-10.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var locationServices = true
    var onlineMode = false
    var musicSuggestions = true
    var voiceControl = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    //User presses different switches, values change
    @IBAction func locationServicesSwitchPressed(sender: UISwitch) {
         locationServices = !locationServices
    }
    @IBAction func onlineModeSwitchPressed(sender: UISwitch) {
        onlineMode = !onlineMode
    }
    @IBAction func musicSuggestionsSwitchPressed(sender: UISwitch) {
        musicSuggestions = !musicSuggestions
    }
    @IBAction func voiceControlSwitchPressed(sender: UISwitch) {
        voiceControl = !voiceControl
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "settingsToMain" {
            let destinationVC = segue.destinationViewController as? MainViewController
            destinationVC?.showSuggestions = musicSuggestions
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
