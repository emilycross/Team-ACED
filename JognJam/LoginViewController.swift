//
//  LoginViewController.swift
//  JognJam
//
//  Created by Emily Cross on 2016-11-09.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    var counter = 0;
    var timeInterval = NSTimer()
    
    @IBOutlet weak var logo: UIButton!
    let image1 = UIImage(named: "Logo1.png")
    let image2 = UIImage(named: "Logo2.png")
    
    
    func incrementTimer() {
        if (counter%2 == 0) {
            logo.setImage(image1, forState: UIControlState.Normal)
        }
        
        else {
            logo.setImage(image2, forState: UIControlState.Normal)
            
        }
        counter += 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logo.layer.cornerRadius = logo.frame.size.width/2
        
        logo.clipsToBounds = true
        
        timeInterval = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(incrementTimer), userInfo: nil, repeats: true)

        
        // Do any additional setup after loading the view.*/
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

}
