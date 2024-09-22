//
//  MovieListViewModel.swift
//  MovieBoxMVVM
//
//  Created by Ahmet Tunahan Bekdaş on 16.09.2024.
//

import Foundation
import MovieBoxAPI

final class MovieListViewModel: MovieListViewModelProtocol {
    weak var delegate: MovieListViewModelDelegate?
    private let service: TopMovieServiceProtocol
    var movieList: [Movie] = []
    
    init(service: TopMovieServiceProtocol) {
        self.service = service
    }
    
    func load() {
        notify(.updateTitle("Movies"))
        notify(.setLoading(true))
        service.fetchMovies { [weak self] result in
            guard let self = self else { return }
            self.notify(.setLoading(false))
            switch result {
            case .succes(let response):
                self.movieList = response.results
                let presenatations = response.results.map({ MoviePresentation(movie: $0) })
                self.notify(.showMovieList(presenatations))
            case .failure(let error):
                print(error)
            @unknown default:
                print("Error")
            }
        }
    }
    
    func notify(_ output: MovieListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
    
    func selectMovie(at index: Int) {
        let selectedMovie = movieList[index]
        let viewModel = MovieDetailViewModel(movie: selectedMovie)
        delegate?.navigate(to: .detail(viewModel))
    }
}
