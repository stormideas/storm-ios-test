//
//  PhotosViewModel.swift
//  TakeHomeApp
//
//  Created by Silvia Kuzmova on 08.07.22.
//

import Foundation

class PhotosViewModel {

    let placeId: String

    init(placeId: String) {
        self.placeId = placeId
    }

    func fetchPhotos(onCompleted: @escaping ([URL]?, Error?) -> Void) {
        let urlString = Endpoint.mainURLString + "/places/" + placeId + "/photos"
        let url = URL(string: urlString)!

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }

            do {
                let decoder = JSONDecoder()
                let byDateSortedPhotos = try decoder.decode([Photo].self, from: data)
                    .sorted { $0.createdAt < $1.createdAt }
                    .compactMap {$0.imageURL}

                onCompleted(byDateSortedPhotos, nil)
            } catch {
                print(error)
                onCompleted(nil, error)
            }
        }
        task.resume()
    }
    
}
