//
//  MovieDetailViewController.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 3.09.2024.
//

import UIKit
import MovieBoxAPI

final class MovieDetailViewController: UIViewController {
    var movie: Movie!
    @IBOutlet var customView: MovieDetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    private func updateView() {
        self.customView.updateMovieDetail(movie.map(MovieDetailPresentation.init)!)
    }
}
