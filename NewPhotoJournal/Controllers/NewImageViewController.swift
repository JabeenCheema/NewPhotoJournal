//
//  NewImageViewController.swift
//  NewPhotoJournal
//
//  Created by Jabeen's MacBook on 1/14/19.
//  Copyright © 2019 Jabeen's MacBook. All rights reserved.
//

import UIKit
import AVFoundation

class NewImageViewController: UIViewController {

    
    private var imagePhotoJournalViewController: UIImagePickerController!
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImagePickerViewController()

        
    }
    
    private func setupImagePickerViewController() {
        imagePhotoJournalViewController = UIImagePickerController()
        imagePhotoJournalViewController.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            cameraButton.isEnabled = false
        }
    }
    
    private func showImagePickerController() {
        present (imagePhotoJournalViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func photoLibraryButtonPressed(_ sender: UIBarButtonItem) {
    imagePhotoJournalViewController.sourceType = .photoLibrary
        showImagePickerController()
    }
    
    @IBAction func cameraButtonPressed(_ sender: UIBarButtonItem) {
    imagePhotoJournalViewController.sourceType = .camera
        showImagePickerController()
    }
    
    @IBAction func savePhotoJournal(_ sender: UIBarButtonItem) {
        }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

}

extension NewImageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
     //       savePhotoJournal(image: image)
        } else {
            print("original image is nil")
        }
    dismiss(animated: true, completion: nil)
    }
}
