//
//  AppRouter.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 2.09.2024.
//

import UIKit

final class AppRouter {
    func start() {
        let viewController = MovieListBuilder.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        // SceneDelegate içinde window'u ayarlayın
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.window?.rootViewController = navigationController
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
}

