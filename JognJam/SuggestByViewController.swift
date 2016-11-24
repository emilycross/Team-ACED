//
//  SuggestByViewController.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-15.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class SuggestByViewController: UIViewController {

    var user = userProfile()
    var player = musicPlayer()
    @IBOutlet weak var profilePictureButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "suggestByToMain" {
            let destinationVC = segue.destinationViewController as? MainViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
        else if segue.identifier == "suggestByToProfile" {
            let destinationVC = segue.destinationViewController as? ProfileViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
        else if segue.identifier == "suggestByToSuggestionsArtist" {
            let destinationVC = segue.destinationViewController as? SuggestionsViewController
            destinationVC?.user = self.user
            destinationVC?.suggestBy = "artist"
            destinationVC?.player = self.player
        }
        else if segue.identifier == "suggestByToSuggestionsGenre" {
            let destinationVC = segue.destinationViewController as? SuggestionsViewController
            destinationVC?.user = self.user
            destinationVC?.suggestBy = "genre"
            destinationVC?.player = self.player
        }
        else if segue.identifier == "suggestByToSuggestionsSpeed" {
            let destinationVC = segue.destinationViewController as? SuggestionsViewController
            destinationVC?.user = self.user
            destinationVC?.suggestBy = "speed"
            destinationVC?.player = self.player
        }
        else if segue.identifier == "suggestByToSuggestionsLocation" {
            let destinationVC = segue.destinationViewController as? SuggestionsViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
            destinationVC?.suggestBy = "location"
        }
    }

}
