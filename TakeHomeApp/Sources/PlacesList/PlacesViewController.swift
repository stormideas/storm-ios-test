import UIKit
import SnapKit

class PlacesViewController: UIViewController {

    // MARK: UI Elements

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 50
        tableView.showsHorizontalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PlaceTableViewCell.self)
        return tableView
    }()

    private let viewModel = PlacesViewModel()

    private var places: [Place] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()

        viewModel.fetchPlaces { [weak self] places, error in
            guard let self = self else { return }
            guard error == nil else {
                // todo: show error
                return
            }
            if let places = places {
                DispatchQueue.main.async {
                    self.places = places
                }
                print(places.map { $0.name })
            }
        }
    }
}

// MARK: - UITableView

extension PlacesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension PlacesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlaceTableViewCell.reuseIdentifier, for: indexPath)
        guard let placeCell = cell as? PlaceTableViewCell else { return cell }
        let viewModel = PlaceTableViewViewModel(place: places[indexPath.row])
        placeCell.bind(viewModel)
        return placeCell
    }
}

// MARK: - Private

private extension PlacesViewController {

    func setupViews() {
        view.backgroundColor = UIColor.systemBackground

        title = "Places"
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }

    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
