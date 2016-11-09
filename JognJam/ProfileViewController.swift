//
//  ProfileViewController.swift
//  JognJam
//
//  Created by Angela Dini on 2016-11-09.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var currentSpeed = 0 //will change with accelerometer
    var highestSpeed = 1 //will change with accelerometer
    @IBOutlet weak var currentSpeedLabel: UILabel!
    @IBOutlet weak var highestSpeedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentSpeedLabel.text = "" + String(currentSpeed) + " km/h"
        highestSpeedLabel.text = "" + String(highestSpeed) + " km/h"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Will probably not need
    //The profile picture button has been pressed
    @IBAction func profilePicturePressed(sender: UIButton) {
        
    }
    
    //The playlist button has been pressed
    @IBAction func playlistsPressed(sender: UIButton) {
        
    }
    
    //The routes button has been pressed
    @IBAction func routesPressed(sender: UIButton) {
        
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