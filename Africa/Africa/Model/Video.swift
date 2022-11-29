//
//  Video.swift
//  Africa
//
//  Created by Bishwajit Purkaystha on 30/11/22.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String

    // Computed property
    var thumbnail: String {
        "video-\(id)"
    }
}
