//
//  ProfilePictureViewController.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-15.
//  Copyright © 2016 Team ACED. All rights reserved.
//


//Obtained image picking abilities from https://turbofuture.com/cell-phones/Access-Photo-Camera-and-Library-in-Swift

import UIKit

class ProfilePictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    
    var user = userProfile()
    var player = musicPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /* Makes the status bar visible */
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        /* Set profile picture image */
        imageView.image = user.picture
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* Methods from the modal page that is shown after the profile picture is pressed */
    @IBAction func changeProfilePictureCamera(sender: UIButton) {
        
        /* Uses camera to change profile picture */
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            let imagePick = UIImagePickerController()
            imagePick.delegate = self
            imagePick.sourceType = UIImagePickerControllerSourceType.Camera
            imagePick.allowsEditing = false
            self.presentViewController(imagePick, animated:true, completion: nil)
         }
    }
    
    /* Changes profile picture from photo library */
    @IBAction func changeProfilePictureLibrary(sender: UIButton) {
         if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let imagePick = UIImagePickerController()
            imagePick.delegate = self
            imagePick.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            imagePick.allowsEditing = true
            self.presentViewController(imagePick, animated: true, completion: nil)
         }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        user.picture = image
        imageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
     }

    /* Segue preparation */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "profilePictureToProfile" {
            let destinationVC = segue.destinationViewController as? ProfileViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
    }

}
