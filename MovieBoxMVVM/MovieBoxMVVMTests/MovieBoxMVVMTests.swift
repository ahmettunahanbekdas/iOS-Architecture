//
//  MovieBoxMVVMTests.swift
//  MovieBoxMVVMTests
//
//  Created by Ahmet Tunahan Bekdaş on 14.09.2024.
//

import XCTest
@testable import MovieBoxMVVM
@testable import MovieBoxAPI


final class MovieBoxMVVMTests: XCTestCase {
    
    private var view: MockView!
    private var viewModel: MovieListViewModel!
    private var service: MockTopMovieService!
    
    override func setUpWithError() throws {
        view = MockView()
        service = MockTopMovieService()
        viewModel = MovieListViewModel(service: service)
        viewModel.delegate = view
    }
    
    func testExample() throws {
        // Given:
        let movie1 = try ResourceLoader.loadMovie(resource: .movie1)
        let movie2 = try ResourceLoader.loadMovie(resource: .movie2)
        service.movies = [movie1, movie2]
        
        // When:
        viewModel.load()
        
        // Then:
        XCTAssertEqual(view.outputs.count, 4)
        
        switch view.outputs[0] {
        case.updateTitle(_):
            // Success!!
             break
        default:
            XCTFail("setLoading test Error")
        }
        
        XCTAssertEqual(.updateTitle("Movies"), view.outputs[0])
        
        XCTAssertEqual(view.outputs[1], .setLoading(true))
        XCTAssertEqual(view.outputs[2], .setLoading(false))
        
        let expectedMovies = [movie1, movie2].map({MoviePresentation(movie: $0)})
        XCTAssertEqual(view.outputs[3], .showMovieList(expectedMovies))
    }
    
    func testNavigation() throws {
        // Given:
        let movie1 = try ResourceLoader.loadMovie(resource: .movie1)
        let movie2 = try ResourceLoader.loadMovie(resource: .movie2)
        service.movies = [movie1, movie2]
        viewModel.load()
        view.reset()
        
        //When:
        viewModel.selectMovie(at: 0)
        
        //Then:
        XCTAssertTrue(view.detailRouterCalled)
    }

}

private class MockView: MovieListViewModelDelegate{
    var outputs: [MovieListViewModelOutput] = []
    var detailRouterCalled: Bool = false
    
    func reset() {
        outputs.removeAll()
        detailRouterCalled = false
    }
    
    func handleViewModelOutput(_ output: MovieBoxMVVM.MovieListViewModelOutput) {
        outputs.append(output)
    }
    
   func navigate(to route: MovieBoxMVVM.MovieListViewRoute) {
       switch route {
       case.detail:
           detailRouterCalled = true
       }
   }
}



final class MockTopMovieService: TopMovieServiceProtocol {
 var movies: [Movie] = []

 func fetchMovies(completion: @escaping (MovieBoxAPI.Result<MovieBoxAPI.TopMovieResponse>) -> Void) {
     completion(.succes(TopMovieResponse(movies: movies)))
 }
}
