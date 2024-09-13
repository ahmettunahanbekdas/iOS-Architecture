//
//  MoviePresentation.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 2.09.2024.
//

import Foundation
import MovieBoxAPI

class MoviePresentation: NSObject {
    let title: String
    let detail: String
    
    init(title: String, detail: String) {
        self.title = title
        self.detail = detail
        super.init()
    }
}

extension MoviePresentation {
    convenience init(movie: Movie) {
        self.init(title: movie.name!, detail: movie.artistName!)
    }
}
