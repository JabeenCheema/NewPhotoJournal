//
//  PhotoJournalModel.swift
//  NewPhotoJournal
//
//  Created by Jabeen's MacBook on 1/17/19.
//  Copyright © 2019 Jabeen's MacBook. All rights reserved.
//

import Foundation

final class PhotoJournalModel {
    private static let filename = "NewPhotoJournal.plist"
    private static var photos = [PhotoJournal]()
    
    static func getPhotos() -> [PhotoJournal]{
        // FileManager
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        if FileManager.default.fileExists(atPath: path){
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    photos = try PropertyListDecoder().decode([PhotoJournal].self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            }
        } else {
            print("\(filename) does not exist")
        }
        photos = photos.sorted(by: {$0.date > $1.date})
        return photos
    }
    
    static func addPhoto(photo: PhotoJournal){
        // append to the array of photos
        photos.append(photo)
        save()
    }
    static func delete(photo: PhotoJournal, atIndex index: Int) {
        photos.remove(at: index )
        save()
    }
    
    static func save() {
        // path
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(photos)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
    static func editPhoto(photo: PhotoJournal, atIndex index:Int) { // this function allows us to save our changes
        photos.remove(at: index)
        photos.insert(photo, at: index)
        save()
    }
    
}


