//
//  MovieListContracts.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 2.09.2024.
//

import Foundation


protocol MovieListViewProtocol {
    var  delegate: MovieListViewDelegate? { get set }
    func updateMovieList(_ movieList: [MoviePresentation])
}

protocol MovieListViewDelegate: AnyObject {
    func didSelectMovie(at index: Int)
}
