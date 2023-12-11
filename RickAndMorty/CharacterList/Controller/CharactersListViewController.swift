//
//  CharactersListViewController.swift
//  RickAndMorty
//
//  Created by Edgar Guitian Rey on 11/12/23.
//

import UIKit

class CharactersListViewController: UIViewController {
    var mainView: CharactersListView { self.view as! CharactersListView }
    let apiClient = CharactersListAPIClient()
    private var tableViewDataSource: CharactersListTableViewDataSource?
    private var tableViewDelegate: CharacterListTableViewDelegate?
    private var cacheDataSource: CacheCharacterListDataSourceType?
    var characterDetailCoordinator: CharacterDetailPushCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewDelegate?.didTapOnCell = { [weak self] index in
            guard let dataSource = self?.tableViewDataSource else {
                return
            }

            let characterModel = dataSource.characters[index]
            self?.characterDetailCoordinator = CharacterDetailPushCoordinator(
                navigationController: self?.navigationController,
                characterModel: characterModel)
            self?.characterDetailCoordinator?.start()

        }

        Task {
            let characterListCache = await self.cacheDataSource?.getCharacterList()

            if !characterListCache!.isEmpty {
                tableViewDataSource?.set(characters: characterListCache!)
            } else {
                let characters = await apiClient.getCharactersList()
                print("Charactres \(characters)")
                
                tableViewDataSource?.set(characters: characters.results)
            }
        }
    }

    override func loadView() {
        view = CharactersListView()
        tableViewDelegate = CharacterListTableViewDelegate()
        tableViewDataSource = CharactersListTableViewDataSource(tableView: mainView.charactersTableView)
        cacheDataSource = SwiftDataCacheDataSource(container: SwiftDataContainer.shared)
        mainView.charactersTableView.dataSource = tableViewDataSource
        mainView.charactersTableView.delegate = tableViewDelegate

    }

}
