//
//  VideoModel.swift
//  Africa
//
//  Created by Clément Causer on 05/05/2022.
//

import Foundation

struct Video: Identifiable, Codable {
    let id: String
    let name: String
    let headline: String
    
    // COMPUTED PROPERTY
    var thumbnail: String {
        "video-\(id)"
    }
}
