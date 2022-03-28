//
//  PlacesListView.swift
//  TakeHomeApp
//
//  Created by Hesham Donia on 28/03/2022.
//

import SnapKit

class PlacesListView: BaseView {
    
    lazy var placesTableView: UITableView = {
        var tableView = UITableView()
        tableView.register(PlaceCell.self, forCellReuseIdentifier: PlaceCell.identifier)
        return tableView
    }()
    
    init(view: UIView, dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        super.init(view: view)
        placesTableView.dataSource = dataSource
        placesTableView.delegate = delegate
    }
    
    func configureViews() {
        containerView.addSubViews(subViews: [placesTableView])
        
        placesTableView.snp.makeConstraints { [weak self] make in
            guard let self = self else {return}
            make.leading.top.equalTo(self.containerView).offset(8)
            make.bottom.trailing.equalTo(self.containerView).inset(8)
        }
    }
}
