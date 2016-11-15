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
    var profileImage: UIImage = UIImage(named:"Logo2_Circle.png")!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = profileImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Methods from the modal page that is shown after the profile picture is pressed
    @IBAction func changeProfilePictureCamera(sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            let imagePick = UIImagePickerController()
            imagePick.delegate = self
            imagePick.sourceType = UIImagePickerControllerSourceType.Camera
            imagePick.allowsEditing = false
            self.presentViewController(imagePick, animated:true, completion: nil)
         }
    }
    
    @IBAction func changeProfilePictureLibrary(sender: UIButton) {
         if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let imagePick = UIImagePickerController()
            imagePick.delegate = self
            imagePick.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            imagePick.allowsEditing = true
            self.presentViewController(imagePick, animated: true, completion: nil)
         }
    }
    @IBAction func viewProfilePicture(sender: UIButton) {
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        profileImage = image
        imageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
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
        if segue.identifier == "profilePictureToProfile" {
            let destinationVC = segue.destinationViewController as? ProfileViewController
            destinationVC?.user.picture = self.profileImage
        }
    }

}
