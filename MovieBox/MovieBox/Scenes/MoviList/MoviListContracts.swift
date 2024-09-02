//
//  MoviListContracts.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 2.09.2024.
//

import Foundation

struct MovieContracts {
    let title: String
    let detail: String
}

protocol MoviListViewProtocol {
    func updateMovieList(_ movie: [MovieContracts])
}
