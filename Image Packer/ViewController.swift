//
//  ViewController.swift
//  Image Packer
//
//  Created by Mehedi on 2/14/20.
//  Copyright © 2020 MatrixSolution. All rights reserved.
//

import UIKit
 

class ViewController: UIViewController {

    @IBOutlet weak var selectedImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ClickedOnButton(_ sender: UIButton) {
        
        let optionMenu = UIAlertController(title: nil, message: "Add Photo", preferredStyle: .actionSheet)

        let galleryAction = UIAlertAction(title: "Gallery", style: .default, handler:{
            (alert: UIAlertAction!) -> Void in
            //self.PickImageForPhotoLibrary()
            self.pickVideoFromGallery()
        })

        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler:{
            (alert: UIAlertAction!) -> Void in
            self.PickImageForCamera()
        })

        let cancleAction = UIAlertAction(title: "Cancel", style: .cancel, handler:{
            (alert: UIAlertAction!) -> Void in
            print("Cancel")
        })

        optionMenu.addAction(galleryAction)
        optionMenu.addAction(cameraAction)
        optionMenu.addAction(cancleAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
}

extension ViewController{
    
    func PickImageForCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let picker = UIImagePickerController()
            picker.delegate = (self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate)
            picker.sourceType = .camera
            picker.allowsEditing = true
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    func pickVideoFromGallery(){
        VideoHelper.startMediaBrowser(delegate: self, sourceType: .photoLibrary)
    }
    
    func PickImageForPhotoLibrary(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //MARK: The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let presentImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        //MARK: Set photoImageView to display the selected image.
        self.selectedImage.image = presentImage

        //MARK: Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    
}

