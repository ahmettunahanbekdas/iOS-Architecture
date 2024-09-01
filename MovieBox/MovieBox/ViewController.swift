//
//  ViewController.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 29.08.2024.
//

import UIKit
import MovieBoxAPI
class ViewController: UIViewController {

    let services: TopMovieServiceProtocol = TopMovieService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        services.fetchMovies { (result) in
            print(result)
        }
    }
}

