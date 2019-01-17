//
//  NewImageViewController.swift
//  NewPhotoJournal
//
//  Created by Jabeen's MacBook on 1/14/19.
//  Copyright © 2019 Jabeen's MacBook. All rights reserved.
//

import UIKit

class NewImageViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func photoLibraryButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func cameraButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func savePhotoJournal(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    

}

extension NewImageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        <#code#>
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        <#code#>
    }
}
