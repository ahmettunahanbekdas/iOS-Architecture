//
//  MovieTests.swift
//  MovieBoxAPITests
//
//  Created by Ahmet Tunahan Bekdaş on 29.08.2024.
//

import XCTest
@testable import MovieBoxAPI

final class MovieTests: XCTestCase {

    func testParsing() throws {
        
        let movie = try ResourceLoader.loadMovie(resource: .movie)
        
        XCTAssertEqual(movie.artistName, "Sabrina Carpenter")
        XCTAssertEqual(movie.name, "Short n' Sweet")
        XCTAssertEqual(movie.contentAdvisoryRating, "Explict")
        XCTAssertEqual(movie.genres?.count, 2)
        XCTAssertEqual(movie.genres?.first?.name, "Pop")
    }
}
