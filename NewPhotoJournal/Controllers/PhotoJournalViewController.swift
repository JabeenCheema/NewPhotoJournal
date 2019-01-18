//
//  ViewController.swift
//  NewPhotoJournal
//
//  Created by Jabeen's MacBook on 1/14/19.
//  Copyright © 2019 Jabeen's MacBook. All rights reserved.
//

import UIKit


class PhotoJournalViewController: UIViewController {
    
    var photos = PhotoJournalModel.getPhotos() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
   
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPhotosFromModel()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self 
        getPhotosFromModel()
    }
    
    func getPhotosFromModel() {
        photos = PhotoJournalModel.getPhotos()
    }
    
    func segue() {
        
    }
    
    @IBAction func addButtonpressed(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let destination = storyboard.instantiateViewController(withIdentifier: "NewImageViewController") as? NewImageViewController else {return}
        present(destination, animated: true, completion: nil)
    }
    
    func editPhoto(index: Int) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let destination = storyBoard.instantiateViewController(withIdentifier: "NewImageViewController") as? NewImageViewController else {return}
        destination.photojournal = photos[index]
        destination.indexNumber = index
        present(destination, animated: true, completion: nil)
        
    }
    
    
    @IBAction func activityButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Actions", message: "pick one", preferredStyle: .actionSheet)
        
        let edit = UIAlertAction.init(title: "Edit", style: .default) { (alert: UIAlertAction) in
            self.editPhoto(index: sender.tag)
            print("Edit button was clicked")
        }
        
        let share = UIAlertAction.init(title: "Share", style: .default) { (alert: UIAlertAction) in
            print("Share button was clicked")
        
    }
        let delete = UIAlertAction.init(title: "Delete", style: .destructive) { (alert: UIAlertAction) in
            PhotoJournalModel.delete(atIndex: sender.tag)
            self.getPhotosFromModel()
            print("Delete button was clicked")
    
        }
        
        let cancel = UIAlertAction.init(title: "Cancel", style: .cancel) { (action) in
            
        }
        alert.addAction(delete)
        alert.addAction(edit)
        alert.addAction(share)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}
extension PhotoJournalViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        let photoJournalToSet = photos[indexPath.row]
        cell.photoDescription.text = photoJournalToSet.description
        cell.photoDate.text = photoJournalToSet.date
        cell.activityButton.tag = indexPath.row
        cell.imageView.image = UIImage.init(data: photoJournalToSet.imageData)
        return cell
    }
   
    
    
}
