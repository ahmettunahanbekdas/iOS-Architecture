//
//  MockTopMovieService.swift
//  MovieBoxMVVMTests
//
//  Created by Ahmet Tunahan Bekdaş on 19.09.2024.
//

import Foundation
@testable import MovieBoxAPI

   final class MockTopMovieService: TopMovieServiceProtocol {
    var movies: [Movie] = []

    func fetchMovies(completion: @escaping (MovieBoxAPI.Result<MovieBoxAPI.TopMovieResponse>) -> Void) {
        completion(.succes(TopMovieResponse(movies: movies)))
    }
}
    
    

