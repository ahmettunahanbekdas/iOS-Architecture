//
//  MovieBoxAPIClient.swift
//  MovieBoxAPI
//
//  Created by Ahmet Tunahan Bekdaş on 27.08.2024.
//

import Foundation
import Alamofire

public final class MovieBoxAPIClient {
    
    public static func testRun() {
        
        print("TestRun runs!")
    }
    
    
    
    public static func testAlamofire() {
            let url = "https://jsonplaceholder.typicode.com/posts/1"
            
        
        
            AF.request(url).responseDecodable(of: Post.self) { response in
                switch response.result {
                case .success(let post):
                    print("Alamofire çalışıyor, JSON verisi: \(post)")
                case .failure(let error):
                    print("Alamofire hatası: \(error)")
                }
            }
        }
}




