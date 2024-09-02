//
//  MovieListViewController.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 2.09.2024.
//

import UIKit
import MovieBoxAPI

final class MovieListViewController: UIViewController {
    @IBOutlet var customView: MovieListView!
    var services: TopMovieServiceProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        services.fetchMovies { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .succes(let value):
                print("ss")
                self.customView.updateMovieList(value.results.map(MoviePresentation.init))
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}

