//
//  MovieListContracts.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 2.09.2024.
//

import Foundation

struct MoviePresentation {
    let title: String
    let detail: String
}

protocol MovieListViewProtocol {
    func updateMovieList(_ movieList: [MoviePresentation])
}
