//
//  Place.swift
//  TakeHomeApp
//
//  Created by Hesham Donia on 28/03/2022.
//

import Foundation

struct PlacesResponse: Codable {
    var places: [Place]?
}

struct Place: Codable {
    var id: String?
    var createdAt: String?
    var name: String?
    var thumbnail: String?
}
