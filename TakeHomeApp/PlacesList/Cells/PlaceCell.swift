//
//  PlaceCell.swift
//  TakeHomeApp
//
//  Created by Hesham Donia on 28/03/2022.
//

import UIKit

class PlaceCell: UITableViewCell {
    
    public static let identifier = "PlaceCell"
    var view: PlaceCellView?
    
    func configureCell(place: Place?) {
        selectionStyle = .none
        view = PlaceCellView(view: contentView)
        view?.configureViews()
        view?.showData(place: place)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        view?.resetViews()
    }
}
