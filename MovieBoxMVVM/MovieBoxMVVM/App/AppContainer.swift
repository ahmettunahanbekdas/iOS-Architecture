//
//  AppContainer.swift
//  MovieBoxMVVM
//
//  Created by Ahmet Tunahan Bekdaş on 14.09.2024.
//

// Burası bizim aslında Dependency Container'mız diyebiliriz.

import Foundation
import MovieBoxAPI

let app = AppContainer()

final class AppContainer {
    let service = TopMovieService()
    let router = AppRouter()
}
