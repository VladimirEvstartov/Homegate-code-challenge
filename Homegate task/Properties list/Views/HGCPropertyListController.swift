//
//  HGTPropertyListController.swift
//  Homegate task
//
//  Created by Vladimir on 25.06.2021.
//

import UIKit

class HGCPropertyListController: HGCBaseViewController {

    @IBOutlet weak var tableView: UITableView!

    let presenter: HGCPropertyListPresenter = HGCPropertyListPresenter()
    private let cellHeight: CGFloat = 340
    private let bottomContentInset: CGFloat = 60

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        setupViews()
        registerCells()
        presenter.fetchProperies()
    }

    private func setupViews() {
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomContentInset, right: 0)

    }

    private func registerCells() {
        tableView.register(UINib(nibName: HGCNibs.propertyCell, bundle: nil), forCellReuseIdentifier: HGCNibs.propertyCell)
    }

}

// MARK: - HGCPresenterDelegate
extension HGCPropertyListController: HGCPresenterDelegate {
    func updateUI() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate
extension HGCPropertyListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}

// MARK: - UITableViewDataSource 
extension HGCPropertyListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HGCNibs.propertyCell, for: indexPath)
        if let propertyCell = cell as? HGCPropertyCell {
            propertyCell.model = presenter.modelForRow(indexPath.row)
            propertyCell.delegate = presenter
        }
        return cell
    }
}
