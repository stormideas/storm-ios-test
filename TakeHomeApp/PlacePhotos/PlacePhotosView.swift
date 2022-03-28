//
//  PlacePhotosView.swift
//  TakeHomeApp
//
//  Created by Hesham Donia on 28/03/2022.
//

import SnapKit

class PlacePhotosView: BaseView {
    lazy var placePhotosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        var collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collectionView.register(PlacePhotoCell.self, forCellWithReuseIdentifier: PlacePhotoCell.identifier)
        collectionView.contentInsetAdjustmentBehavior = .never
        return collectionView
    }()
    
    init(view: UIView, dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate, layoutDelegate: UICollectionViewDelegateFlowLayout) {
        super.init(view: view)
        placePhotosCollectionView.dataSource = dataSource
        placePhotosCollectionView.delegate = delegate
        placePhotosCollectionView.isPagingEnabled = true
    }
    
    func configureViews() {
        containerView.addSubViews(subViews: [placePhotosCollectionView])
        
        placePhotosCollectionView.snp.makeConstraints { [weak self] make in
            guard let self = self else {return}
            make.leading.top.equalTo(self.containerView)
            make.bottom.trailing.equalTo(self.containerView)
        }
    }
}
