//
//  AppContainer.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 2.09.2024.
//

//
    
//

// ????? Dependency Injection, App Container, final, AppDelegate.

// P.2  App Container Class -> Bu kod class, merkezi bir noktadan uygulamanın önemli bileşenlerine (sevis ve yönlendirmeler - TopMovieService, AppRouter gibi) erişim sağlar. Bu yapı, uygulama boyunca bu bileşenleri kolayca kullanmamıza ve yönetmemize yardımcı olur.
// Dependency Injection prensbini sağlar ve bağımlılıkların tek bir yerden yönetilmesini sağlar.

// 1. let app = AppContainer() -> Bu satır, AppContainer sınıfının bir örneğini oluşturur ve onu app adıyla global bir değişkene atar. Uygulama genelinde bu app nesnesine erişilebilir, böylece service ve router gibi özelliklere erişim sağlanır.
// 2. AppContainer sınıfı, uygulamanın merkezi yapılandırma noktasıdır. Bu sınıf, uygulama genelinde ihtiyaç duyulan hizmetleri ve yönlendirme işlemlerini içerir.
// 3. router, uygulamanın yönlendirme işlerini yönetir. AppRouter sınıfı, hangi ekranın ne zaman açılacağını yönetir. Bu router nesnesi de AppContainer içinde tanımlanarak buradan erişim sağlanır.

import Foundation
import MovieBoxAPI

let app = AppContainer()

final class AppContainer {
    let service = TopMovieService()
    let router = AppRouter()
}
