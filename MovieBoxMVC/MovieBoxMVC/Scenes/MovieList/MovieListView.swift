//
//  MovieListView.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 2.09.2024.
//

import UIKit

class MovieListView: UIView {
    @IBOutlet weak var tableView: UITableView!
    private var movieList: [MoviePresentation] = []
    weak var delegate: MovieListViewDelegate?
}

extension MovieListView: MovieListViewProtocol {
    func setLoading(_ isLoading: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
    }
    
    func updateMovieList(_ movieList: [MoviePresentation]) {
        self.movieList = movieList
        tableView.reloadData()
    }
}

extension MovieListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath)
        let movie = movieList[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text  = movie.detail
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
}

extension MovieListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectedMovie(at: indexPath.row)
    }
}


