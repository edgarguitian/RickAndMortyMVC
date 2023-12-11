//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Edgar Guitian Rey on 11/12/23.
//

import Foundation
import UIKit

class CharacterDetailViewController: UIViewController {
    var mainView: CharacterDetailView { self.view as! CharacterDetailView }

    init(characterDetailModel: CharacterModel) {
        super.init(nibName: nil, bundle: nil)
        mainView.configure(characterDetailModel)
    }

    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented")
    }

    override func loadView() {
        view = CharacterDetailView()

    }

}
