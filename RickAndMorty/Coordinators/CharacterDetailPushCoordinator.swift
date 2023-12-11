//
//  CharacterDetailPushCoordinator.swift
//  RickAndMorty
//
//  Created by Edgar Guitian Rey on 11/12/23.
//

import Foundation
import UIKit

class CharacterDetailPushCoordinator: Coordinator {
    var navigationController: UINavigationController?
    let characterModel: CharacterModel

    init(navigationController: UINavigationController?, characterModel: CharacterModel) {
        self.navigationController = navigationController
        self.characterModel = characterModel
    }

    func start() {
        let characterDetailViewController = CharacterDetailViewController(characterDetailModel: characterModel)
        navigationController?.pushViewController(characterDetailViewController, animated: true)
    }
}
