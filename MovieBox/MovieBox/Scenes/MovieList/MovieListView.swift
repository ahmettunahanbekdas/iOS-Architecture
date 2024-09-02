//
//  MovieListView.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 2.09.2024.
//

import UIKit

final class MovieListView: UIView {
    
    private var movieList: [MoviePresentation] = []
    
    @IBOutlet weak var tableView: UITableView!
}

extension MovieListView: MovieListViewProtocol {
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
        return 10
    }
}

extension MovieListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
