//
//  MoviePresentation.swift
//  MovieBoxMVVM
//
//  Created by Ahmet Tunahan Bekdaş on 16.09.2024.
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
    
    convenience init(movie: Movie) {
        self.init(title: movie.name!, detail: movie.artistName!)
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? MoviePresentation else { return false }
        return self.title == other.title && self.detail == other.detail
    }
}
