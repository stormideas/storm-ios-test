//
//  Place.swift
//  TakeHomeApp
//
//  Created by Silvia Kuzmova on 05.07.22.
//

import Foundation

struct Place {
    let id: String
    let createdAt: Date
    let name: String
    let thumbnailURL: URL?
}

extension Place: Decodable {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        let createdAtString = try container.decode(String.self, forKey: .createdAt)
        let dateFormatter = ISO8601DateFormatter() // todo
        createdAt = dateFormatter.date(from: createdAtString) ?? Date()
        let thumbnailURLString = try container.decode(String.self, forKey: .thumbnailURL)
        thumbnailURL = URL(string: thumbnailURLString)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case createdAt
        case name
        case thumbnailURL = "thumbnail"
    }
}
