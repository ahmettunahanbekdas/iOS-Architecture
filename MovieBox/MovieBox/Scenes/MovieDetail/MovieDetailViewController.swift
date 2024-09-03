//
//  MovieDetailViewController.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 3.09.2024.
//

import UIKit
import MovieBoxAPI

final class MovieDetailViewController: UIViewController {
    
    @IBOutlet var customView: MovieDetailView!

    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    private func updateView() {
        customView.updateMovieDetail(movie.map(MovieDetailPresentation.init)!)
    }
}
