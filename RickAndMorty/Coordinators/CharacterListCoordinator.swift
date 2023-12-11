//
//  CharacterListCoordinator.swift
//  RickAndMorty
//
//  Created by Edgar Guitian Rey on 11/12/23.
//

import Foundation
import UIKit

class CharacterListCoordinator: Coordinator {
    var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let charactersListViewController = storyBoard
            .instantiateViewController(withIdentifier: "CharacterListViewController")

        navigationController?.pushViewController(charactersListViewController, animated: true)
    }

}
