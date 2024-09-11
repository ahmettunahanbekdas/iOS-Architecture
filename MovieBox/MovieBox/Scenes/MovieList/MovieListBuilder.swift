//
//  MovieListBuilder.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 2.09.2024.
//

import UIKit

// ????? Bundle, Type Casting, Dependency Injection,

// P.4-> Builder ile proje oluşturulmaya başlanıyor.

// 1. make fonksiyonu bize bir adet MovieListViewController döndürücek.
// 2. UIStoryBoar'mızın name'i verildi ve ana Bundle'dan alındı.
// 3. ViewController'mız eklendi type casting yapıldı.
// 4. Burada, viewController'ın service özelliğine uygulamanın servis nesnesi atanır. Bu, view controller'ın ihtiyaç duyduğu servisi sağlar.Bağımlılık enjeksiyonu (dependency injection) örneğidir ve uygulamanın genel servis yapılandırmasına bağlı olarak tanımlanmış olmalıdır.
// 5. Oluşturduğumuz ViewController' ı dönüyoruz.

final class MovieListBuilder {
    static func make() -> MovieListViewController {
        let storyboard = UIStoryboard(name: "MovieList", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieListViewController") as! MovieListViewController
        viewController.service = app.service 
        return viewController
    }
}


