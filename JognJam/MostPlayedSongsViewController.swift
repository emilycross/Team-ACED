//
//  MostPlayedSongsViewController.swift
//  JognJam
//
//  Created by Emily Cross on 2016-12-05.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class MostPlayedSongsViewController: UIViewController {

    
    var user = userProfile()
    var player = musicPlayer()
    
    var numTimes = [0, 0, 0, 0, 0]

    
    @IBOutlet weak var song1: UIButton!
    @IBOutlet weak var song1NumTimes: UILabel!
    
    @IBOutlet weak var song2: UIButton!
    @IBOutlet weak var song2NumTimes: UILabel!
    
    @IBOutlet weak var song3: UIButton!
    @IBOutlet weak var song3NumTimes: UILabel!
    
    @IBOutlet weak var song4: UIButton!
    @IBOutlet weak var song4NumTimes: UILabel!
    
    @IBOutlet weak var song5: UIButton!
    @IBOutlet weak var song5NumTimes: UILabel!
    
    @IBOutlet weak var profilePictureButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
        
        var timesPlayed = player.numberOfTimesPlayed
        var sortedTimesPlayed = player.numberOfTimesPlayed.sort()
        
        for i in 4...0 {
            numTimes[i] = sortedTimesPlayed[i]
            if (i == 0) {
                song1NumTimes.text = "Played " + String(numTimes[i]) + " Times"
            }
            
            else if (i == 1) {
                song2NumTimes.text = "Played " + String(numTimes[i]) + " Times"
            }
            
            else if (i == 2) {
                song3NumTimes.text = "Played " + String(numTimes[i]) + " Times"
            }
            
            else if (i == 3) {
                song4NumTimes.text = "Played " + String(numTimes[i]) + " Times"
            }
            
            else if (i == 4) {
                song5NumTimes.text = "Played " + String(numTimes[i]) + " Times"
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    /* segue preparation */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "mostPlayedSongsToPlaylist" {
            let destinationVC = segue.destinationViewController as? PlaylistViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
            
        else if segue.identifier == "mostPlayedSongsToProfile" {
            let destinationVC = segue.destinationViewController as? ProfileViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
        else if segue.identifier == "mostPlayedSongsToLogin" {
            self.user.start = true
            self.player.pause()
        }
        
        
    }
    
    
    

}
