//
//  PlaceTableViewCell.swift
//  TakeHomeApp
//
//  Created by Silvia Kuzmova on 07.07.22.
//

import UIKit
import Kingfisher

class PlaceTableViewCell: UITableViewCell {

    // MARK: - Constants

    enum Constants {
        static let iconHeight: CGFloat = 80
    }

    private let iconView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .gray
        view.clipsToBounds = true
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.contentMode = .left
        return label
    }()

    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.contentMode = .right
        return label
    }()

    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()

    private let nameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()

    var isDarkMode: Bool = false

    // MARK: - Properties


    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        iconView.layer.cornerRadius = Constants.iconHeight * 0.5
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconView.image = nil
    }

    // MARK: - Public

    func bind(_ viewModel: PlaceTableViewViewModel) {
        titleLabel.text = viewModel.title
        dateLabel.text = viewModel.createdAt

        let url = viewModel.iconURL
        iconView.kf.setImage(with: url)
    }
}

// MARK: - Private

private extension PlaceTableViewCell {

    func setupViews() {
        contentView.addSubview(containerStackView)

        containerStackView.addArrangedSubview(iconView)
        containerStackView.addArrangedSubview(nameStackView)

        nameStackView.addArrangedSubview(titleLabel)
        nameStackView.addArrangedSubview(dateLabel)
    }

    func setupConstraints() {
        containerStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
                .inset(20)
            make.top.bottom.equalToSuperview()
                .inset(12)
        }

        iconView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.width.equalTo(iconView.snp.height)
        }
    }
}
