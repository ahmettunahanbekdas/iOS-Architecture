//
//  MovieDetailBuilder.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 3.09.2024.
//

import UIKit
import MovieBoxAPI

final class MovieDetailBuilder {
    static func make(with movie: Movie) -> MovieDetailViewController {
        let storyboard = UIStoryboard(name: "MovieDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        viewController.movie = movie
        return viewController
    }
}



