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
    
    var service: TopMovieServiceProtocol!
    var movieList: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.delegate = self
        showData()
    }
}

extension MovieListViewController: MovieListViewDelegate{
    
    func showData() {
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
    }
    
    func didSelectMovie(at index: Int) {
        let movie = movieList[index]
        let detailViewController = MovieDetailBuilder.make(with: movie)
        show(detailViewController, sender: nil)
    }
}

