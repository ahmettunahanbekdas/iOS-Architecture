//
//  Model.swift
//  MovieBoxAPI
//
//  Created by Ahmet Tunahan Bekdaş on 28.08.2024.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
