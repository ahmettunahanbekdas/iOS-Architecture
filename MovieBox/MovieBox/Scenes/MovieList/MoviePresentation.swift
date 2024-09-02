//
//  MoviePresentation.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 2.09.2024.
//

import Foundation
import MovieBoxAPI

struct MoviePresentation {
    let title: String
    let detail: String
}

extension MoviePresentation {
    init(movie: Movie) {
        self.init(title: movie.name!, detail: movie.artistName!)
    }
}
