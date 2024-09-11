//
//  MovieBoxTests.swift
//  MovieBoxTests
//
//  Created by Ahmet Tunahan Bekdaş on 4.09.2024.
//

import XCTest
@testable import MovieBox
@testable import MovieBoxAPI


final class MovieBoxTests: XCTestCase {
    var service: MockTopMovieService!
    var view: MockMovieListView!
    var controller: MovieListViewController!
    
    
    override func setUpWithError() throws {
        service = MockTopMovieService()
        view = MockMovieListView()
        controller = MovieListViewController()
        
        controller.customView = view
        controller.service = service
    }

    // MARK: - testMovieList()
    func testMovieList() throws {
        // Given: Servisin başlatıldığı ve bir film nesnesinin yüklendiği bir durum
        let movie1 = try ResourceLoader.loadMovie(resource: .movie1)
        let movie2 = try ResourceLoader.loadMovie(resource: .movie2)
        service.movies = [movie1, movie2]
        
        // When
        controller.loadViewIfNeeded()
        
        // Then
        XCTAssertEqual(view.movieList?.count, 2)
        XCTAssertEqual(try view.movieList?.element(at: 0).title, movie1.name)
        XCTAssertEqual(try view.movieList?.element(at: 1).title, movie2.name)
//        XCTAssertEqual(try view.movieList?[0].title, movie1.artistName)
    }
    
    // MARK: - MockTopMovieService
    final class MockTopMovieService: TopMovieServiceProtocol {
        var movies: [Movie] = []
        
        func fetchMovies(completion: @escaping (MovieBoxAPI.Result<MovieBoxAPI.TopMovieResponse>) -> Void) {
            completion(.succes(TopMovieResponse(movies: movies)))
        }
    }
    
    // MARK: - MockMovieListView
    final class MockMovieListView: MovieListViewProtocol {
        var delegate: MovieListViewDelegate?
        var isLoadingValue: [Bool] = []
        var movieList: [MoviePresentation]?
        
        func setLoading(_ isLoading: Bool) {
            isLoadingValue.append(isLoading)
        }
        
        func updateMovieList(_ movieList: [MovieBox.MoviePresentation]) {
            self.movieList = movieList
        }
    }
}


