//
//  MovieDetailViewModel.swift
//  MovieBoxMVVM
//
//  Created by Ahmet Tunahan Bekdaş on 20.09.2024.
//

import Foundation
import MovieBoxAPI

protocol MovieDetailViewModelProtocol {
    var delegate: MovieDetailViewModelDelegate? { get set }
    func load()
}

protocol MovieDetailViewModelDelegate: AnyObject  {
    func showDetail(_ presentation: MovieDetailPresentation)
}

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
    weak var delegate: MovieDetailViewModelDelegate?
    var presentation: MovieDetailPresentation
    
    init(movie: Movie) {
        self.presentation = MovieDetailPresentation(movie: movie)
    }
    
    func load() {
        delegate?.showDetail(presentation)
    }
}
