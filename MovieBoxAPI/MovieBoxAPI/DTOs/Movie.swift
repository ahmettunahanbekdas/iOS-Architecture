//
//  Music.swift
//  MovieBoxAPI
//
//  Created by Ahmet Tunahan Bekdaş on 29.08.2024.
//

//{
//                "artistName": "Sabrina Carpenter",
//                "id": "1750307020",
//                "name": "Short n' Sweet",
//                "releaseDate": "2024-08-23",
//                "kind": "albums",
//                "artistId": "390647681",
//                "artistUrl": "https://music.apple.com/us/artist/sabrina-carpenter/390647681",
//                "contentAdvisoryRating": "Explict",
//                "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Music221/v4/f6/15/d0/f615d0ab-e0c4-575d-907e-1cc084642357/24UMGIM61704.rgb.jpg/100x100bb.jpg",
//                "genres": [
//                    {
//                        "genreId": "14",
//                        "name": "Pop",
//                        "url": "https://itunes.apple.com/us/genre/id14"
//                    },
//                    {
//                        "genreId": "34",
//                        "name": "Music",
//                        "url": "https://itunes.apple.com/us/genre/id34"
//                    }
//                ],
//                "url": "https://music.apple.com/us/album/short-n-sweet/1750307020"
// }


import Foundation

public struct Movie: Decodable {
    
    public enum CodingKeys: String, CodingKey {
        case artistName
        case name
        case releaseDate
        case contentAdvisoryRating
        case image = "artworkUrl100"
        case genres
     }
    
    public let artistName: String?
    public let name: String?
    public let releaseDate: Date?
    public let contentAdvisoryRating: String?
    public let image: URL?
    public let genres: [Genre]?
}

public struct Genre: Decodable {
    public let name: String?
}



