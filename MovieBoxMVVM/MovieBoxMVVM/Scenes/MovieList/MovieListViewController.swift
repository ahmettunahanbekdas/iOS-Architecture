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
    private var movieList: [MoviePresentation] = []
    
    var viewModel: MovieListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
    }
}

extension MovieListViewController: MovieListViewModelDelegate {
    func navigate(to route: MovieListViewRoute) {
        switch route {
        case.detail(let toViewModel):
            let viewController = MovieDetailBuilder.make(with: toViewModel)
            show(viewController, sender: nil)
            break
        }
    }
    
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case.setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case.showMovieList(let movieList):
            self.movieList = movieList
            tableView.reloadData()
        }
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath)
        let movie = movieList[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = movie.detail
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectMovie(at: indexPath.row)
    }
}
