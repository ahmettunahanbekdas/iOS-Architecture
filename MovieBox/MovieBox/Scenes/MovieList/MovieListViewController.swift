//
//  MovieListViewController.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 2.09.2024.
//

// ????? UIViewController, super.init(), closure bloc asenkron işleme, map, [weak self],   guard let self = self else { return }, ARC, Retain Cycle,

// P.5 -> MovieListViewController -> Bu sınıf UIViewController'dan türetilmiştir ve uygulamanın View bileşenlerini yönetir ve kullanıcı etkileşimlerini yönetir.

// 1. @IBOutlet weak var customView: MovieListViewProtocol!: MovieListView'a referans, View ile etkileşim sağlar.
// 2. Film verilerini almak ve kullanıcıya sunmak için bir servis kullanılır (TopMovieServiceProtocol).
// 3. var movieList: [Movie] = [] -> Filmleri saklayan bir dizi, servis aracalığıyla alınan film verilerini içerir.
// 4. func getData() -> Verileri service aracılığıyla alır ve sonuçları customView'e ileterek günceller.
// 5. extension MovieListViewController: MovieListViewDelegate: -> Kullanıcı etkileşimlerini yönetir. Kullanıcı bir film seçtiğinde detay ekranına geçiş yapar.

// DF.1 -> fetchMovies() -> Film verilerini almak adına bir ağ isteği yapar, bu işlem asenkron olarak gerçekleşir, yani veri geldiğinde sonuç bir closure içinde işlenir [weak self] döngüsel referansı engellemek için kullanılır. Bu bellek yönetimi için önemlidir

// DF.5 service.fetchMovies { [weak self] result in ... } -> fetch fonksiyonu çağrılır. Bu asenkron bir işlemdir, yani hemen sonuç dönmeyecektir. Ağ isteği tamamlandığında result adında bir clousure ile geri döner
// Closure result'u işledikten sonra ağ isteği tamamlandığında .succes veya .failure iki durumda inceler
// self.movieList = value.results -> burada value(TopMovieResponse) tipinde dönen değerimizin içersinde ki results(Movie) değerimizi MovieListViewController'mız içersinde bulunan MovieList içersine atıyoruz daha sonrasında indexine ulaşarak detay sayfasına gitmek için kullanmak üzere
// self.customView.updateMovieList(value.results.map(MoviePresentation.init)) -> Dönen TopMovieResponse tipinde ki value objesinin içersinde bulunan Model tipinde ki result değerine erişilir


import UIKit
import MovieBoxAPI

final class MovieListViewController: UIViewController {
    
    @IBOutlet weak var customView: MovieListViewProtocol!
    
    var service: TopMovieServiceProtocol!
    var movieList: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        customView.delegate = self
        getData()
    }
}

extension MovieListViewController {
    func getData() {
        customView.setLoading(true)
        service.fetchMovies { [weak self] result in
            guard let self = self else { return } // Bellek sızıntısını önmelemek için gerçekleşir
            switch result {
            case .succes(let value):
                self.movieList = value.results
                self.customView.updateMovieList(value.results.map(MoviePresentation.init))
//                self.customView.updateMovieList(value.results.map { MoviePresentation(movie: $0) })
            case .failure(let error):
                print(error)
            @unknown default:
                print("Error")
            }
        }
        customView.setLoading(false)
    }
}

extension MovieListViewController: MovieListViewDelegate {
    func didSelectedMovie(at index: Int) {
        let selectedMovie = movieList[index]
        let movieDetailViewController = MovieDetailBuilder.make(with: selectedMovie)
        show(movieDetailViewController, sender: nil)
    }
}

