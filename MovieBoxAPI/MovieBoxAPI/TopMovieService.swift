//
//  TopMovieService.swift
//  MovieBoxAPI
//
//  Created by Ahmet Tunahan Bekdaş on 30.08.2024.

// ?????

// P.6

// DF.2 -> AF.request(urlString).response { (response) in ... } kısmı belirtilen URL'den veri çekmek için ağ isteği başlatır.
// Başarı dudumunda dönen veri (let data) alınır.
// Hata durumunda yani ağ isteği başrısız olursa, bu hata completion bloğuna iletilir.
// Başarı durumunda let decoder? Decoders.plainDateDecoder ile JSON verisi daha önce yaratılan JSONDecoder'i güncelleyen plainDecoder kullanılarak decode edilir.
// let response = try decoder.decode(TopMovieResponse.self, from: data!) satırı JSON verisini TopMovieResponse nesnesine dönüştürür.
// Decoda işlemi başarılı olursa dönüştürülen veri,completion(.succes(response)) ile tamamlayıcı bloğa (completion) gönderilir.


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
        AF.request(urlString).response { response in
            switch response.result {
            case.success(let data):
                let decoder = Decoders.plainDateDecoder
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



