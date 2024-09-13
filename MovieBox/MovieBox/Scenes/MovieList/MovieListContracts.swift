//
//  MovieListContracts.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 2.09.2024.
//

import Foundation

@objc protocol MovieListViewProtocol: AnyObject {
    var delegate: MovieListViewDelegate? { get set }
    func updateMovieList(_ movieList: [MoviePresentation])
    func setLoading(_ isLoading: Bool)
}

@objc protocol MovieListViewDelegate: AnyObject {
    func didSelectedMovie(at index: Int)
}
 

