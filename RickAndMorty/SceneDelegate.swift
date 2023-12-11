//
//  SceneDelegate.swift
//  RickAndMorty
//
//  Created by Edgar Guitian Rey on 11/12/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var characterListCoordinator: CharacterListCoordinator?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: scene)
        let navigationController = UINavigationController()
        characterListCoordinator = CharacterListCoordinator(navigationController: navigationController)

        guard let window = window else {
            return
        }

        guard let characterListCoordinator = characterListCoordinator else {
            return
        }

        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        characterListCoordinator.start()

    }
}
