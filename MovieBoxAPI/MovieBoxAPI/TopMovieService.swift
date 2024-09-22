//
//  TopMovieService.swift
//  MovieBoxAPI
//
//  Created by Ahmet Tunahan Bekdaş on 30.08.2024.
//

import Foundation
import Alamofire

public protocol TopMovieServiceProtocol {
    func fetchMovies(completion: @escaping (Result<TopMovieResponse>) -> Void)
}


public class TopMovieService: TopMovieServiceProtocol {
    public enum Error: Swift.Error {
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
    
    public init() {}
    
    public func fetchMovies(completion: @escaping (Result<TopMovieResponse>) -> Void) {
        
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/25/albums.json"
        
        AF.request(urlString).response { (response) in
            switch response.result {
            case.success(let data):
                let decoder = Decoders.plainDateDecoder
                do{
                    let response = try decoder.decode(TopMovieResponse.self, from: data!)
                    completion(.succes(response))
//                    print(response)
                }catch {
                    completion(.failure(Error.serializationError(internal: error)))
                }
            case.failure(let error):
                completion(.failure(Error.networkError(internal: error)))
            }
        }
    }
}



