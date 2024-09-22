//
//  MovieDetailViewController.swift
//  MovieBoxMVVM
//
//  Created by Ahmet Tunahan Bekdaş on 20.09.2024.
//

import UIKit

final class MovieDetailViewController: UIViewController{
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieArtistLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    
    var viewModel: MovieDetailViewModelProtocol! {
        didSet{
            viewModel.delegate = self
        }
    }
      
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
    }
}

extension MovieDetailViewController: MovieDetailViewModelDelegate {
    func showDetail(_ presentation: MovieDetailPresentation) {
        movieTitleLabel.text = presentation.title
        movieArtistLabel.text = presentation.detail
        movieGenreLabel.text = presentation.genre.description
    }
}
