//
//  CharacterModelData.swift
//  RickAndMorty
//
//  Created by Edgar Guitian Rey on 11/12/23.
//

import Foundation
import SwiftData

@Model
class CharacterModelData {
    let name: String
    let status: String
    let species: String
    let image: String

    init(name: String, status: String, species: String, image: String) {
        self.name = name
        self.status = status
        self.species = species
        self.image = image
    }
}
