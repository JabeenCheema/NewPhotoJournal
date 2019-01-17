//
//  PhotoJournal.swift
//  NewPhotoJournal
//
//  Created by Jabeen's MacBook on 1/17/19.
//  Copyright © 2019 Jabeen's MacBook. All rights reserved.
//

import Foundation

struct PhotoJournal: Codable {
    
    let createdAt: String
    let imageData: Data
    let description: String
}
