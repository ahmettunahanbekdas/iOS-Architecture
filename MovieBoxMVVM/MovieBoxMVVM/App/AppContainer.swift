//
//  AppContainer.swift
//  MovieBoxMVVM
//
//  Created by Ahmet Tunahan Bekdaş on 14.09.2024.
//

import Foundation
import MovieBoxAPI

let app = AppContainer()

final class AppContainer {
    let service = TopMovieService()
    let router = AppRouter()
}
