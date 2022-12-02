//
//  ViewController.swift
//  XOneTT
//
//  Created by MacMini on 23.11.22.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var weatherView: UIView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    private var tableViewModel: TableViewViewModelType!
    private var collectionViewModel: CollectionViewViewModelType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelPrepare()
        registerNibs()
        setupUI()
    }
    
    private func setupUI() {
        weatherView.layer.cornerRadius = 10
        weatherView.backgroundColor = #colorLiteral(red: 0.2995038033, green: 0.3665243387, blue: 0.4399251938, alpha: 1).withAlphaComponent(0.5)
        tableView.layer.cornerRadius = 10
        tableView.backgroundColor = #colorLiteral(red: 0.2995038033, green: 0.3665243387, blue: 0.4399251938, alpha: 1).withAlphaComponent(0.5)
        tableView.allowsSelection = false
    }
    
    private func viewModelPrepare() {
        let viewModel = MainViewModel()
        viewModel.fetchData { [weak self] weatherModel in
            self?.cityLabel.text = weatherModel.city
            self?.temperatureLabel.text = weatherModel.tmpr
            self?.descriptionLabel.text = weatherModel.description
        }
        tableViewModel = viewModel as TableViewViewModelType
        collectionViewModel = viewModel as CollectionViewViewModelType
    }
    
    private func registerNibs() {
        let collectionNib = UINib(nibName: String(describing: CollectionViewCell.self), bundle: nil)
        let tableNib = UINib(nibName: String(describing: TableViewCell.self), bundle: nil)
        let headerNib = UINib(nibName: String(describing: TableViewHeader.self), bundle: nil)
        collectionView.register(collectionNib, forCellWithReuseIdentifier: Identifiers.collectionCell.rawValue)
        tableView.register(tableNib, forCellReuseIdentifier: Identifiers.tableCell.rawValue)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: Identifiers.tableHeader.rawValue)
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewModel.getCollectionCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.collectionCell.rawValue, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        cell.viewModel = collectionViewModel.getCollectionCellModel(forIndexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionView.frame.width * 0.1
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.getTableCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.tableCell.rawValue) as? TableViewCell else { return UITableViewCell() }
        cell.viewModel = tableViewModel.getTableCellModel(forIndexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / CGFloat(tableViewModel.getTableCount() + 1)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: Identifiers.tableHeader.rawValue) as! TableViewHeader
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.height / CGFloat(tableViewModel.getTableCount() * 3)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
}
