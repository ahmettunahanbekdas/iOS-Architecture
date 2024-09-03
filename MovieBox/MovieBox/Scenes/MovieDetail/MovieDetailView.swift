//
//  MovieDetailView.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 3.09.2024.
//

import UIKit

final class MovieDetailView: UIView {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var genre: UILabel!
}

extension MovieDetailView: MovieDetailViewProtocol {
    func updateMovieDetail(_ selectedMovie: MovieDetailPresentation) {
        self.title.text = selectedMovie.title
        self.detail.text = selectedMovie.detail
        self.genre.text = selectedMovie.genre
    }
    
}
