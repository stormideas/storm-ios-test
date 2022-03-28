//
//  PlacePhotoCell.swift
//  TakeHomeApp
//
//  Created by Hesham Donia on 28/03/2022.
//

import UIKit

class PlacePhotoCell: UICollectionViewCell {
    public static let identifier = "PlacePhotoCell"
    var view: PlacePhotoCellView?
    
    func configureCell(image: String?) {
        view = PlacePhotoCellView(view: contentView)
        view?.configureViews()
        view?.showData(image: image)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        view?.resetViews()
    }
    
}
