//
//  AppContainer.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 2.09.2024.
//

import Foundation
import MovieBoxAPI

let app = AppContainer()

final class AppContainer {
    let service = TopMovieService()
    let router = AppRouter()
}
