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
    private let genreCellID = "GenreUICell"
    var delegate: GenresViewControllerDelegate?
    
    private var tableModel = [Genre]() {
        didSet { tableView.reloadData() }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(GenreUICell.self, forCellReuseIdentifier: genreCellID)
        delegate?.didRequestToRefreshList()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: genreCellID, for: indexPath) as! GenreUICell
        let viewModel = tableModel[indexPath.row]
        cell.textLabel?.text = viewModel.title
        cell.didTap = {
            let alert = UIAlertController(title: viewModel.title, message: viewModel.cursor.uuidString, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        return cell
    }
}

extension GenresListViewController: IGenresListView {
    
    func display(_ viewModel: GenresListViewModel) {
        tableModel = viewModel.list
    }
}
