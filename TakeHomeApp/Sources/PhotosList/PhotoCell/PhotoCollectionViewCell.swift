//
//  PhotoCollectionViewCell.swift
//  TakeHomeApp
//
//  Created by Silvia Kuzmova on 08.07.22.
//

import UIKit
import Kingfisher

class PhotoCollectionViewCell: UICollectionViewCell {

    // MARK: - Views

    private let photoImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(photoURL: URL?) {
        photoImageView.kf.setImage(with: photoURL,
                                   placeholder: UIImage(named: "placeholder"))
    }
}

// MARK: - Private

private extension PhotoCollectionViewCell {

    func setupViews() {
        backgroundColor = .white
        contentView.addSubview(photoImageView)
    }

    func setupConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
