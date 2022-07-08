//
//  PlaceTableViewViewModel.swift
//  TakeHomeApp
//
//  Created by Silvia Kuzmova on 07.07.22.
//

import Foundation

struct PlaceTableViewViewModel {

    let place: Place

    let formatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter
    }()

    var title: String {
        return place.name
    }

    var iconURL: URL? {
        return place.thumbnailURL
    }

    var createdAt: String {
        return formatter.string(from: place.createdAt)
    }
}
