//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Edgar Guitian Rey on 11/12/23.
//

import Foundation

struct CharacterModel: Decodable {
    let name: String
    let status: String
    let species: String
    let image: String
}
