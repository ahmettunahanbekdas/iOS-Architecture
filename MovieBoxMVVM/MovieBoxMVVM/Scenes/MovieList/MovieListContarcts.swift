//
//  MovieListContarcts.swift
//  MovieBoxMVVM
//
//  Created by Ahmet Tunahan Bekdaş on 16.09.2024.
//

import Foundation

protocol MovieListViewModelProtocol: AnyObject {
    var delegate: MovieListViewModelDelegate? { get set }
    func load()
    func selectMovie(at index: Int)
}

protocol MovieListViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: MovieListViewModelOutput)
    func navigate(to route: MovieListViewRoute)
}

enum MovieListViewModelOutput: Equatable {
    case updateTitle(String)
    case setLoading(Bool)
    case showMovieList([MoviePresentation])
}
 
enum MovieListViewRoute {
    case detail(MovieDetailViewModelProtocol)
}
