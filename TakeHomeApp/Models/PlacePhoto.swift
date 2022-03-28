//
//  PlacePhoto.swift
//  TakeHomeApp
//
//  Created by Hesham Donia on 28/03/2022.
//

import Foundation

struct PlacePhotosResponse: Codable {
    var placePhotos: [PlacePhoto]?
}

struct PlacePhoto: Codable {
    var id: String?
    var createdAt: String?
    var placeId: String?
    var image: String?
}
