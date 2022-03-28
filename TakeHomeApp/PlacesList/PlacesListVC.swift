import UIKit

class PlacesListVC: UIViewController {
    
    var placesListView: PlacesListView!
    var viewModel: PlacesViewModel? = PlacesViewModelImpl()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Places"
        placesListView = PlacesListView(view: view, dataSource: self, delegate: self)
        placesListView.configureViews()
        
        viewModel?.places?.bind({ [weak self] _ in
            self?.placesListView.placesTableView.reloadData()
        })
        viewModel?.loading?.bind({ [weak self] isLoading in
            if isLoading {
                self?.placesListView.showLoader()
            } else {
                self?.placesListView.hideLoader()
            }
            
        })
        viewModel?.error?.bind({ [weak self] errorMessage in
            self?.placesListView.showErrorMessage(message: errorMessage)
        })
        viewModel?.getPlaces()
    }
}

extension PlacesListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.places?.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PlaceCell.identifier, for: indexPath) as? PlaceCell {
            cell.selectionStyle = .none
            cell.configureCell(place: viewModel?.places?.value[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PlacePhotosVC()
        vc.placeId = viewModel?.places?.value[indexPath.row].id
        vc.placeName = viewModel?.places?.value[indexPath.row].name
        navigationController?.pushViewController(vc, animated: true)
    }
}
