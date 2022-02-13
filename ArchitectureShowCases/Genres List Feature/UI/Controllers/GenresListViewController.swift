//
//  GenresListViewController.swift
//  ArchitectureShowCases
//
//  Created by Alexander Nikolaychuk on 13.02.2022.
//

import UIKit

protocol GenresViewControllerDelegate {
    func didRequestToRefreshList()
}

final class GenresListViewController: UITableViewController {
    
    var delegate: GenresViewControllerDelegate?
    
    private var tableModel = [GenreCellController]() {
        didSet { tableView.reloadData() }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        delegate?.didRequestToRefreshList()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableModel[indexPath.row].view(in: tableView)
    }
}

extension GenresListViewController: IGenresListView {
    
    func display(_ viewModel: GenresListViewModel) {
        tableModel = viewModel.list
    }
}
