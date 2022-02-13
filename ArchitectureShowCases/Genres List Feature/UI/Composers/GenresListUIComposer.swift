//
//  GenresListUIComposer.swift
//  ArchitectureShowCases
//
//  Created by Alexander Nikolaychuk on 13.02.2022.
//

import UIKit

final class GenresListUIComposer {
    static func createModule() -> UIViewController {
        let vc = GenresListViewController()
        let loader = FakeNetworkGenresLoader()
        let presenter = GenresListPresenter(view: vc, loader: loader)
        vc.delegate = presenter
        return vc
    }
}
