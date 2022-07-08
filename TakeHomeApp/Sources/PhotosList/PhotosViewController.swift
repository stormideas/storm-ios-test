//
//  PhotosViewController.swift
//  TakeHomeApp
//
//  Created by Silvia Kuzmova on 08.07.22.
//

import UIKit

class PhotosViewController: UIViewController {

    private lazy var photosCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            return layout
        }()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotoCollectionViewCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    var photoURLs: [URL] = [] {
        didSet {
            photosCollectionView.reloadData()
        }
    }

    let viewModel: PhotosViewModel

    // MARK: - Init

    init(viewModel: PhotosViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()

        viewModel.fetchPhotos { [weak self] photoURLs, error in
            guard let self = self else { return }
            guard error == nil else {
                // todo: show error
                return
            }
            if let photoURLs = photoURLs {
                DispatchQueue.main.async {
                    self.photoURLs = photoURLs
                }
            }
        }
    }
}

// MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {

    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return photoURLs.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reuseIdentifier, for: indexPath)
        if let photoCell = cell as? PhotoCollectionViewCell {
            photoCell.set(photoURL: photoURLs[indexPath.row])
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension PhotosViewController: UICollectionViewDelegate {}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotosViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: photosCollectionView.frame.width, height: photosCollectionView.frame.height)
    }
}

// MARK: - Private

private extension PhotosViewController {

    func setupViews() {
        view.addSubview(photosCollectionView)
    }

    func setupConstraints() {
        photosCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
