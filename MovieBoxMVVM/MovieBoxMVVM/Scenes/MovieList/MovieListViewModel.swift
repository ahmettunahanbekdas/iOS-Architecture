//
//  MovieListViewModel.swift
//  MovieBoxMVVM
//
//  Created by Ahmet Tunahan Bekdaş on 16.09.2024.
//

import Foundation
import MovieBoxAPI

// MARK: - Protocols & Enum
protocol MovieListViewModelProtocol: AnyObject {
    var delegate: MovieListViewModelDelegate? { get set }
    func load()
    func selectMovie(at index: Int)
}

protocol MovieListViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: MovieListViewModelOutput)
}

enum MovieListViewModelOutput: Equatable {
    case updateTitle(String)
    case setLoading(Bool)
    case showMovieList([MoviePresentation])
}

import Foundation
import MovieBoxAPI

final class MovieListViewModel: MovieListViewModelProtocol {
    
    weak var delegate: MovieListViewModelDelegate?
    private let service: TopMovieServiceProtocol
    private var movies: [Movie] = []
    
    init(service: TopMovieServiceProtocol) {
        self.service = service
    }
    
    func load() {
        notify(.updateTitle("Movies"))
        notify(.setLoading(true))
        
        service.fetchMovies { [weak self] (result) in
            guard let self = self else { return }
            self.notify(.setLoading(false))
            
            switch result {
            case .succes(let response):
                self.movies = response.results
                let presenatations = response.results.map({ MoviePresentation(movie: $0) })
                self.notify(.showMovieList(presenatations))
            case .failure(let error):
                print(error)
            @unknown default:
                print("Error")
            }
        }
    }
    func selectMovie(at index: Int) {
        // TODO: Implement
    }
    
    func notify(_ output: MovieListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
