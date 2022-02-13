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
    let list: [Genre]
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
            let list = (try? result.get()) ?? []
            self?.view.display(.init(list: list))
        }
    }
}
