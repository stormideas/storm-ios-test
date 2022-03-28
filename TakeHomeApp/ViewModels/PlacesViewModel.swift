//
//  PlacesViewModel.swift
//  TakeHomeApp
//
//  Created by Hesham Donia on 28/03/2022.
//

import Foundation

protocol PlacesViewModel {
    var repository: PlacesRepository? {get set}
    var places: Dynamic<[Place]>? { get set }
    var placePhotos: Dynamic<[PlacePhoto]>? {get set}
    var loading: Dynamic<Bool>? {get set}
    var error: Dynamic<String>? {get set}
    func getPlaces()
    func getPlacePhotos(placeId: String)
}

class PlacesViewModelImpl: BaseViewModel, PlacesViewModel {
    
    var repository: PlacesRepository?
    
    var places: Dynamic<[Place]>?
    
    var placePhotos: Dynamic<[PlacePhoto]>?
    
    override init() {
        repository = PlacesRepositoryImpl()
        places = Dynamic([Place]())
        placePhotos = Dynamic([PlacePhoto]())
    }
    
    func getPlaces() {
        loading?.value = true
        repository?.getPlaces { [weak self] places in
            self?.loading?.value = false
            self?.places?.value = places
        } faildHandler: { [weak self] status in
            self?.loading?.value = false
            self?.error?.value = status?.message ?? ""
        }
    }
    
    func getPlacePhotos(placeId: String) {
        loading?.value = true
        repository?.getPlacePhotos(placeId: placeId) { [weak self] placePhotos in
            self?.loading?.value = false
            self?.placePhotos?.value = placePhotos
        } faildHandler: { [weak self] status in
            self?.loading?.value = false
            self?.error?.value = status?.message ?? ""
        }
    }
}
