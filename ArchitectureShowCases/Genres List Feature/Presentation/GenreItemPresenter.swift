//
//  GenreItemPresenter.swift
//  ArchitectureShowCases
//
//  Created by Alexander Nikolaychuk on 13.02.2022.
//

import Foundation

struct GenresItemViewModel {
    let title: String
}

class GenreItemPresenter: GenreCellDelegate {
   
    let genre: Genre
    let view: GenreItemView
    
    init(view: GenreItemView, genre: Genre) {
        self.view = view
        self.genre = genre
    }
    
    func didTap() {
        print("ITEM DID TAP \(genre.title)")
    }
    
    func didLoad() {
        view.display(GenresItemViewModel(title: genre.title))
    }
}
