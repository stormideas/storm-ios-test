//
//  PlacesViewModel.swift
//  TakeHomeApp
//
//  Created by Silvia Kuzmova on 05.07.22.
//

import Foundation

class PlacesViewModel {

    func fetchPlaces(onCompleted: @escaping ([Place]?, Error?) -> Void) {
        let urlString = Endpoint.mainURLString + "/places"
        let url = URL(string: urlString)!

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let places = try decoder.decode([Place].self, from: data)
                let alphabeticallySortedPlaces = places.sorted { $0.name < $1.name }
                onCompleted(alphabeticallySortedPlaces, nil)
            } catch {
                print(error)
                onCompleted(nil, error)
            }
        }
        task.resume()
    }
}
