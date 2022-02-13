//
//  GenresProvider.swift
//  ArchitectureShowCases
//
//  Created by Alexander Nikolaychuk on 13.02.2022.
//

import Foundation

struct Genre {
    let ID: Int
    let title: String
    let databaseID: Int
    let cursor: UUID
}

protocol GenresLoaderProtocol {
    func load(completion: @escaping (Result<[Genre], Error>) -> Void)
}

class FakeNetworkGenresLoader: GenresLoaderProtocol {
    func load(completion: @escaping (Result<[Genre], Error>) -> Void) {
        let item1 = Genre(ID: 0, title: "Genre 1", databaseID: 0, cursor: UUID())
        let item2 = Genre(ID: 1, title: "Genre 2", databaseID: 1, cursor: UUID())
        let item3 = Genre(ID: 2, title: "Genre 3", databaseID: 2, cursor: UUID())
        let item4 = Genre(ID: 3, title: "Genre 4", databaseID: 3, cursor: UUID())
        let item5 = Genre(ID: 4, title: "Genre 5", databaseID: 4, cursor: UUID())
        let item6 = Genre(ID: 5, title: "Genre 6", databaseID: 5, cursor: UUID())
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            completion(.success([item1, item2, item3, item4, item5, item6]))
        })
    }
}
