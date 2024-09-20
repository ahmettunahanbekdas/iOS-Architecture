//
//  MovieListViewController.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 2.09.2024.
//

import UIKit
import MovieBoxAPI

final class MovieListViewController: UIViewController {
    
    @IBOutlet  var customView: MovieListViewProtocol!
    
    var service: TopMovieServiceProtocol!
    var movieList: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        customView.delegate = self
        getData()
    }
}

extension MovieListViewController{
    func getData() {
        customView.setLoading(true)
        service.fetchMovies { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .succes(let value):
                self.movieList = value.results
                self.customView.updateMovieList(value.results.map(MoviePresentation.init))
            case .failure(let error):
                print(error)
            @unknown default:
                print("Error")
            }
        }
        customView.setLoading(false)
    }
}

extension MovieListViewController: MovieListViewDelegate {
    func didSelectedMovie(at index: Int) {
        let selectedMovie = movieList[index]
        let movieDetailViewController = MovieDetailBuilder.make(with: selectedMovie)
        show(movieDetailViewController, sender: nil)
    }
}

