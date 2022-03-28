//
//  PlaceCellView.swift
//  TakeHomeApp
//
//  Created by Hesham Donia on 28/03/2022.
//

import SnapKit
import Alamofire
import AlamofireImage

class PlaceCellView: BaseView {
    
    lazy var placeThumbnailImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var placeNameLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(view: UIView) {
        super.init(view: view)
    }
    
    func configureViews() {
        containerView.addSubViews(subViews: [placeThumbnailImageView, placeNameLabel])
        
        placeThumbnailImageView.snp.makeConstraints { [weak self] make in
            guard let self = self else {return}
            make.leading.top.equalTo(self.containerView).offset(8)
            make.bottom.equalTo(self.containerView).offset(-8)
            make.height.width.equalTo(80)
        }
        
        placeNameLabel.snp.makeConstraints { [weak self] make in
            guard let self = self else {return}
            make.leading.equalTo(self.placeThumbnailImageView.snp.trailing).offset(8)
            make.trailing.equalTo(self.containerView).inset(8)
            make.top.bottom.equalTo(self.placeThumbnailImageView)
        }
    }
    
    func showData(place: Place?) {
        if let placeThumb = place?.thumbnail, let url = URL(string: placeThumb) {
            AF.request(url).responseImage { [weak self] response in
                guard let self = self else {return}
                if case .success(let image) = response.result {
                    self.placeThumbnailImageView.image = image
                }
            }
        }
        
        placeNameLabel.text = place?.name
    }
    
    func resetViews() {
        placeNameLabel.text = ""
        placeThumbnailImageView.image = nil
    }
}
