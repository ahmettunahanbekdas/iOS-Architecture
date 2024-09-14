//
//  MovieListBuilder.swift
//  MovieBoxMVVM
//
//  Created by Ahmet Tunahan Bekdaş on 14.09.2024.
//

import UIKit

final class MovieListBuilder {
    static func make() -> MovieListViewController {
        let storyboard = UIStoryboard(name: "MovieList", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "MovieListViewController") as! MovieListViewController
        viewController.service = app.service
        return viewController
    }
}
