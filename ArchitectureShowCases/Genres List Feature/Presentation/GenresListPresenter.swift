//
//  GenresListPresenter.swift
//  ArchitectureShowCases
//
//  Created by Alexander Nikolaychuk on 13.02.2022.
//

import Foundation

protocol IGenresListView {
    func display(_ viewModel: GenresListViewModel)
}

struct GenresListViewModel {
    let list: [GenreCellController]
}

final class GenresListPresenter {
    let view: IGenresListView
    let loader: GenresLoaderProtocol
    
    init(view: IGenresListView, loader: GenresLoaderProtocol) {
        self.view = view
        self.loader = loader
    }
}

extension GenresListPresenter: GenresViewControllerDelegate {

    func didRequestToRefreshList() {
        loader.load { [weak self] result in
            guard let self = self else { return }
            
            let list = (try? result.get()) ?? []
            let controllers: [GenreCellController] = list.map { genre in
                let cellVC = GenreCellController()
                let cellPresenter = GenreItemPresenter(view: cellVC, genre: genre)
                cellVC.delegate = cellPresenter
                return cellVC
            }
            self.view.display(.init(list: controllers))
        }
    }
}
