//
//  SwiftDataContainer.swift
//  RickAndMorty
//
//  Created by Edgar Guitian Rey on 11/12/23.
//

import Foundation
import SwiftData

class SwiftDataContainer: SwiftDataContainerType {
    static let shared = SwiftDataContainer()

    private let container: ModelContainer?
    private let context: ModelContext?

    private init() {
        let scheme = Schema([CharacterModelData.self])
        do {
            container = try ModelContainer(for: scheme, configurations: [])
            if let container = container {
                context = ModelContext(container)
            } else {
                context = nil
            }
        } catch {
            print("Error al crear el contenedor: \(error)")
            container = nil
            context = nil
        }
    }
    
    func fetchCharacters() -> [CharacterModelData] {
        let descriptor = FetchDescriptor<CharacterModelData>()

        guard let context = context, let characters = try? context.fetch(descriptor) else {
            return []
        }
        
        return characters
    }

    func insert(_ characterList: [CharacterModelData]) async {
        if let context = context {
            characterList.forEach { character in
                context.insert(character)
            }

            try? context.save()
        }
    }
}
