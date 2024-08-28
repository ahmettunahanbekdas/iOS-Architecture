//
//  Movie.swift
//  MovieBoxAPI
//
//  Created by Ahmet Tunahan Bekdaş on 28.08.2024.
//

import Foundation

//{
//    "artistName": "Instagram, Inc.",
//    "id": "6446901002",
//    "name": "Threads",
//    "releaseDate": "2023-07-05",
//    "kind": "apps",
//    "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/49/26/87/492687a7-9158-6566-f26c-c7845a068123/Prod-0-0-1x_U007emarketing-0-7-0-85-220.png/100x100bb.png",
//    "genres": [],
//    "url": "https://apps.apple.com/us/app/threads/id6446901002"
//}


public enum CodingKeys: String, CodingKey  {
    case artistName
    case name
    case releaseDate
    case image = ""
    case genres

}
public struct Movie: Decodable {
    public let artistName: String?
    public let name: String?
    public let releaseDate: Date?
    public let image: URL?
    public let genres: [Genre]?

}

public struct Genre: Decodable {
    public let name:String?
}
