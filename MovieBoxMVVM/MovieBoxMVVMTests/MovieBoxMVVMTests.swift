//
//  MovieBoxMVVMTests.swift
//  MovieBoxMVVMTests
//
//  Created by Ahmet Tunahan Bekdaş on 14.09.2024.
//

import XCTest
@testable import MovieBoxMVVM

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

        switch   view.outputs[0] {
        case .updateTitle(_):
            break
        default:
            XCTFail("First Output should be 'updateTitle'")
        }
        
        XCTAssertEqual(view.outputs[1], .setLoading(true))
        XCTAssertEqual(view.outputs[2], .setLoading(false))
        
        let expectedMovies = [movie1, movie2].map({MoviePresentation(movie: $0)})
        XCTAssertEqual(view.outputs[3], .showMovieList(expectedMovies))
    }
}

private class MockView: MovieListViewModelDelegate{
    
    var outputs: [MovieListViewModelOutput] = []
    
    func handleViewModelOutput(_ output: MovieBoxMVVM.MovieListViewModelOutput) {
        outputs.append(output)
    }
}

