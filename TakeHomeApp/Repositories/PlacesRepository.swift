//
//  PlacesRepository.swift
//  TakeHomeApp
//
//  Created by Hesham Donia on 28/03/2022.
//

import Foundation

protocol PlacesRepository {
    func getPlaces(completionHandler: @escaping ([Place]) -> (), faildHandler: @escaping (StatusServer?) -> Void)
    func getPlacePhotos(placeId: String, completionHandler: @escaping ([PlacePhoto]) -> (), faildHandler: @escaping (StatusServer?) -> Void)
}

class PlacesRepositoryImpl: PlacesRepository {
    
    func getPlaces(completionHandler: @escaping ([Place]) -> (), faildHandler: @escaping (StatusServer?) -> Void) {
        NetworkingManager.sharedInstance.makeRequest(url: placesUrl, mType: .get) { data in
            let places = try! JSONDecoder().decode([Place].self, from: data)
            completionHandler(places)
        } faildHandler: { status in
            faildHandler(status)
        }
    }
    
    func getPlacePhotos(placeId: String, completionHandler: @escaping ([PlacePhoto]) -> (), faildHandler: @escaping (StatusServer?) -> Void) {
        NetworkingManager.sharedInstance.makeRequest(url: placePhotosUrl.replacingOccurrences(of: "{placeId}", with: placeId), mType: .get) { data in
            let placePhotos = try! JSONDecoder().decode([PlacePhoto].self, from: data)
            completionHandler(placePhotos)
        } faildHandler: { status in
            faildHandler(status)
        }
    }
}
