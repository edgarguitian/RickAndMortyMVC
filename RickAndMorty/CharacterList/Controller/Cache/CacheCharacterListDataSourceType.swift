//
//  CacheCharacterListDataSourceType.swift
//  RickAndMorty
//
//  Created by Edgar Guitian Rey on 11/12/23.
//

import Foundation

protocol CacheCharacterListDataSourceType {
    func getCharacterList() async -> [CharacterModel]
    func saveCharacterList(_ characterList: [CharacterModel]) async
}
