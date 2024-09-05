//
//  ResourceLoader.swift
//  MovieBoxAPITests
//
//  Created by Ahmet Tunahan Bekdaş on 5.09.2024.
//

import Foundation
import MovieBoxAPI

class ResourceLoader {
    
    enum MovieResource: String {
        case movie
    }
    
    static func loadMovie(resource: MovieResource) throws -> Movie {
        let bundle = Bundle.test
        guard let url =  bundle.url(forResource: resource.rawValue, withExtension: "json") else {
            throw NSError(domain: "Invalid URL", code: 404, userInfo: nil)
        }
        let data = try Data(contentsOf: url)
        let decoder = Decoders.plainDateDecoder
        let movie = try decoder.decode(Movie.self, from: data)
        return movie
    }
    
}

private extension Bundle {
    class Dummy { }
    static let test = Bundle(for: Dummy.self)
}
