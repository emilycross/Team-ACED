//
//  LoginViewController.swift
//  JognJam
//
//  Created by Emily Cross on 2016-11-09.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    
    let path = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Logo2", ofType: "png")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = NSData(contentsOfURL:path)

        logo.image = UIImage(data:image!)
        logo.contentMode = .ScaleAspectFit

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

}
