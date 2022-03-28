//
//  PlacePhotosVC.swift
//  TakeHomeApp
//
//  Created by Hesham Donia on 28/03/2022.
//

import UIKit

class PlacePhotosVC: UIViewController {
    
    var placeId: String!
    var placeName: String!
    
    var placePhotosView: PlacePhotosView!
    var viewModel: PlacesViewModel? = PlacesViewModelImpl()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = placeName
        placePhotosView = PlacePhotosView(view: view, dataSource: self, delegate: self)
        placePhotosView.configureViews()
        
        viewModel?.placePhotos?.bind({ [weak self] _ in
            self?.placePhotosView.placePhotosCollectionView.reloadData()
        })
        viewModel?.loading?.bind({ [weak self] isLoading in
            if isLoading {
                self?.placePhotosView.showLoader()
            } else {
                self?.placePhotosView.hideLoader()
            }
        })
        viewModel?.error?.bind({ [weak self] errorMessage in
            self?.placePhotosView.showErrorMessage(message: errorMessage)
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.getPlacePhotos(placeId: placeId)
    }

}

extension PlacePhotosVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.placePhotos?.value.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlacePhotoCell.identifier, for: indexPath) as? PlacePhotoCell {
            cell.configureCell(image: viewModel?.placePhotos?.value[indexPath.row].image)
            return cell
        }
        return UICollectionViewCell()
    }
}
