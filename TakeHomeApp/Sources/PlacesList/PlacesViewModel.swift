//
//  PlacesViewModel.swift
//  TakeHomeApp
//
//  Created by Silvia Kuzmova on 05.07.22.
//

import Foundation

class PlacesViewModel {

    func fetchPlaces(onCompleted: @escaping ([Place]?, Error?) -> Void) {
            let url = URL(string: "https://608948878c8043001757e68c.mockapi.io/api/v1/places")!

            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    let places = try decoder.decode([Place].self, from: data)
                    onCompleted(places, nil)
                } catch {
                    print(error)
                    onCompleted(nil, error)
                }
            }
            task.resume()
    }
}
