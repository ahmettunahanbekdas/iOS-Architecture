//
//  TopMovieService.swift
//  MovieBoxAPI
//
//  Created by Ahmet Tunahan Bekdaş on 30.08.2024.
//
//
import Foundation
import Alamofire

public protocol TopMovieServiceProtocol {
    //Bu şekilde de bir yapı kullabiliriz fakat biz kendimiz bir yapı oluşturucağız video içeriğinde de olduğu gibi (Result)
    //    func fetchMovies(completion: (Result<[Movie], Error>) -> Void)
    
    func fetchMovies(completion: @escaping (Result<TopMovieResponse>) -> Void)
}


public class TopMovieService: TopMovieServiceProtocol {
    //    func fetchMovies(completion: (Result<[Movie], Error>) -> Void){}
    
    
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
                let decoder = Decoders.plainDataDecoder
                do{
                    let response = try decoder.decode(TopMovieResponse.self, from: data!)
                    completion(.succes(response))
                }catch {
                    completion(.failure(Error.serializationError(internal: error)))
                }
            case.failure(let error):
                completion(.failure(Error.networkError(internal: error)))
            }
        }
    }
}

