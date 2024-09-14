//
//  MovieListViewController.swift
//  MovieBoxMVVM
//
//  Created by Ahmet Tunahan Bekdaş on 14.09.2024.
//

import UIKit
import MovieBoxAPI

final class MovieListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var service: TopMovieService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
    }
    
}
