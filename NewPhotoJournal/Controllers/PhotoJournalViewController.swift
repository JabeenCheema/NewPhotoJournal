//
//  ViewController.swift
//  NewPhotoJournal
//
//  Created by Jabeen's MacBook on 1/14/19.
//  Copyright © 2019 Jabeen's MacBook. All rights reserved.
//

import UIKit


class PhotoJournalViewController: UIViewController {
    
   var photos = PhotoJournalModel.getPhotos()
   
@IBOutlet weak var collectionView: UICollectionView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func activityButton(_ sender: Any) {
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
        return cell
    }
   
    
    
}
