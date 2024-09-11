//
//  MovieListView.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 2.09.2024.
//

// ?????  func test(_ test:test)-func test(at test:test) _ at işlevi nedir,

// P.6 MovieListView -> UIView'den türetilmiştir ve kullanıcıya film listesini gösterir, Kullanıcı etkileşimlerine yanıt verir, Görünüm güncellemelerini(tableView'in yeniden yüklenmesi vb.) yapar

// 1. @IBOutlet private weak var tableView: UITableView! -> Film listesini gösterne UITableView
// 2. private var movieList: [MoviePresentation] -> Görüntülünecek film verileri.
// 3. func setLoading(_ isLoading: Bool) -> Yükleme göstergsini ayarlar (isNetworkActivityIndicatorVisible) güncel olarak desteklenmemektedir.
// 4. func updateMovieList(_ movieList: [MoviePresentation]): movieList'i günceller ve tableView'ı yeniden yükler.

import UIKit

@objc protocol MovieListViewProtocol {
    var delegate: MovieListViewDelegate? { get set }
    func updateMovieList(_ movieList: [MoviePresentation])
    func setLoading(_ isLoading: Bool)
}

@objc protocol MovieListViewDelegate {
    func didSelectedMovie(at index: Int)
}

 class MovieListView: UIView {
    @IBOutlet private weak var tableView: UITableView!
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


