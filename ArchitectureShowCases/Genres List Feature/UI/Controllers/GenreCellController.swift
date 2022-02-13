//
//  GenreCellController.swift
//  ArchitectureShowCases
//
//  Created by Alexander Nikolaychuk on 13.02.2022.
//

import UIKit

protocol GenreCellDelegate {
    func didLoad()
    func didTap()
}

protocol GenreItemView {
    func display(_ viewModel: GenresItemViewModel)
}

final class GenreCellController: GenreItemView {
    
    private let genreCellID = "GenreUICell"
    var delegate: GenreCellDelegate?
    var cell: GenreUICell?
    
    func view(in tableView: UITableView) -> UITableViewCell {
        tableView.register(GenreUICell.self, forCellReuseIdentifier: genreCellID)
        cell = tableView.dequeueReusableCell(withIdentifier: genreCellID) as? GenreUICell
        
        cell?.didTap = { [weak self] in
            self?.delegate?.didTap()
        }
        delegate?.didLoad()
        return cell!
    }
    
    func display(_ viewModel: GenresItemViewModel) {
        cell?.textLabel?.text = viewModel.title
    }
}
