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
        
        controller.customView = self.view
        controller.service = service
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMovieList() {
        
    }
    
    
    
    final class MockTopMovieService: TopMovieServiceProtocol {
        var movies: [Movie] = []
        
        func fetchMovies(completion: @escaping (MovieBoxAPI.Result<MovieBoxAPI.TopMovieResponse>) -> Void) {
            completion(.succes(TopMovieResponse(movies: movies)))
        }
    }
    
    final class MockMovieListView: MovieListViewProtocol {
        var delegate: (any MovieBox.MovieListViewDelegate)?
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


