//
//  MovieDetailPresentation.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 3.09.2024.
//

import Foundation
import MovieBoxAPI

struct MovieDetailPresentation {
    let title: String
    let detail: String
    let genre: Date
}

extension MovieDetailPresentation {
    init(movie: Movie) {
        self.title = movie.name!
        self.detail = movie.artistName!
        self.genre = movie.releaseDate!
    }
}
