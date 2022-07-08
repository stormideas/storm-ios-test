//
//  Photo.swift
//  TakeHomeApp
//
//  Created by Silvia Kuzmova on 08.07.22.
//

import Foundation

struct Photo {
    let id: String
    let placeId: String
    let createdAt: Date
    let imageURL: URL?
}

extension Photo: Decodable {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        placeId = try container.decode(String.self, forKey: .placeId)
        let createdAtString = try container.decode(String.self, forKey: .createdAt)
        let dateFormatter = ISO8601DateFormatter() // todo
        createdAt = dateFormatter.date(from: createdAtString) ?? Date()
        let imageURLString = try container.decode(String.self, forKey: .imageURL)
        imageURL = URL(string: imageURLString)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case placeId
        case createdAt
        case imageURL = "image"
    }
}

