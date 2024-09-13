//
//  Decoders.swift
//  MovieBoxAPI
//
//  Created by Ahmet Tunahan Bekdaş on 29.08.2024.
//

import Foundation

public enum Decoders {
   public static let plainDateDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
}
