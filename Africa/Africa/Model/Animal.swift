//
//  Animal.swift
//  Africa
//
//  Created by Bishwajit Purkaystha on 27/11/22.
//

import SwiftUI

struct Animal: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let gallery: [String]
    let fact: [String]
    let image: String
}
