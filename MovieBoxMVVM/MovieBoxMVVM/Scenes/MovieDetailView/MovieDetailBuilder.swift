//
//  MovieDetailBuilder.swift
//  MovieBoxMVVM
//
//  Created by Ahmet Tunahan Bekdaş on 20.09.2024.
//

import UIKit


final class MovieDetailBuilder {
    static func make(with viewModel: MovieDetailViewModelProtocol) -> MovieDetailViewController {
        let storyboard = UIStoryboard(name: "MovieDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
