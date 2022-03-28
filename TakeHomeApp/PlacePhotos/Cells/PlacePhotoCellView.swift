//
//  PlacePhotoCellView.swift
//  TakeHomeApp
//
//  Created by Hesham Donia on 28/03/2022.
//

import SnapKit
import Alamofire
import AlamofireImage

class PlacePhotoCellView: BaseView {
    
    lazy var placePhotoImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(view: UIView) {
        super.init(view: view)
    }
    
    func configureViews() {
        containerView.addSubViews(subViews: [placePhotoImageView])
        
        placePhotoImageView.snp.makeConstraints { [weak self] make in
            guard let self = self else {return}
            make.leading.top.equalTo(self.containerView)
            make.trailing.bottom.equalTo(self.containerView)
        }
    }
    
    func showData(image: String?) {
        if let placeImage = image, let url = URL(string: placeImage) {
            AF.request(url).responseImage { [weak self] response in
                guard let self = self else {return}
                if case .success(let image) = response.result {
                    self.placePhotoImageView.image = image
                }
            }
        }
    }
    
    func resetViews() {
        placePhotoImageView.image = nil
    }
}
