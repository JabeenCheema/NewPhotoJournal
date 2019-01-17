//
//  PhotoJournalModel.swift
//  NewPhotoJournal
//
//  Created by Jabeen's MacBook on 1/17/19.
//  Copyright © 2019 Jabeen's MacBook. All rights reserved.
//

import Foundation

final class PhotoJournalModel {
    private static let filename = "PhotoJournalList.plist"
    
    // making the initializer private so nobody can create an instance of it what we can do is PhotoJournalModel.savePhotoJournal()
    private init() {}
    
    static func savePhotoJournal(photoJournal: PhotoJournal){
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(photoJournal)
            // atomic: write all at once
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
    
    static func getPhotoJournal()-> PhotoJournal? {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        var photoJournal: PhotoJournal?
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    photoJournal = try PropertyListDecoder().decode(PhotoJournal.self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            } else {
                print("getPhotoJournal - data is nil")
            }
        } else {
            print("\(filename) does not exist" )
        }
        return photoJournal
    }
}
