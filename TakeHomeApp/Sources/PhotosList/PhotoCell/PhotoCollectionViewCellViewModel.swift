//
//  PhotoCollectionViewCellViewModel.swift
//  TakeHomeApp
//
//  Created by Silvia Kuzmova on 08.07.22.
//

import Foundation

struct PhotoCollectionViewCellViewModel {

    let photo: Photo

    var imageURL: URL? {
        return photo.imageURL
    }
}
