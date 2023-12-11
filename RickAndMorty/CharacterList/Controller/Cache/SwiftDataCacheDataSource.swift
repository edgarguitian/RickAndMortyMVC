//
//  SwiftDataCacheDataSource.swift
//  RickAndMorty
//
//  Created by Edgar Guitian Rey on 11/12/23.
//

import Foundation

class SwiftDataCacheDataSource: CacheCharacterListDataSourceType {

    private let container: SwiftDataContainerType

    init(container: SwiftDataContainerType) {
        self.container = container
    }

    func getCharacterList() async -> [CharacterModel] {
        let characterList = container.fetchCharacters()
        return characterList.map {
            CharacterModel(name: $0.name, status: $0.status, species: $0.species, image: $0.image)
        }
    }

    func saveCharacterList(_ characterList: [CharacterModel]) async {
        let characterListData = characterList.map {
            CharacterModelData(name: $0.name, status: $0.status, species: $0.species, image: $0.image)
        }
        await container.insert(characterListData)
    }
}
