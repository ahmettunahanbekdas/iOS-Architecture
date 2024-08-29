//
//  Decoders.swift
//  MovieBoxAPI
//
//  Created by Ahmet Tunahan Bekdaş on 29.08.2024.
//

import Foundation

public enum Decoders {
    static let plainDataDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
}
