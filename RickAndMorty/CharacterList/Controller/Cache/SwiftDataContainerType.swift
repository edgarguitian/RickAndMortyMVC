//
//  SwiftDataContainerType.swift
//  RickAndMorty
//
//  Created by Edgar Guitian Rey on 11/12/23.
//

import Foundation

protocol SwiftDataContainerType {
    func fetchCharacters() -> [CharacterModelData]
    func insert(_ characterList: [CharacterModelData]) async
}
