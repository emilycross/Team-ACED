//
//  MainViewController.swift
//  JognJam
//
//  Created by Angela Dini on 2016-11-09.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    var songTitle = ""
    var artist = ""
    //boolean to show that music is playing and the play button is the pause image
    var isPlayingMusic = false
    @IBOutlet weak var playButton: UIButton!
    let playImage = UIImage(named: "playButton.png")
    let pauseImage = UIImage(named: "pauseButton.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        songTitleLabel.text = songTitle
        artistLabel.text = artist
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func playButtonPressed(sender: UIButton) {
        //changes the image
        isPlayingMusic = !isPlayingMusic
        if isPlayingMusic == true {
            
            playButton.setImage(pauseImage, forState: UIControlState.Normal)
        }
        else {
            playButton.setImage(playImage, forState: UIControlState.Normal)
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
