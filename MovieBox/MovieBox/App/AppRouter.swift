//
//  AppRouter.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 2.09.2024.

// ?????

// P.3 Bu kod bloğu, bir iOS uygulamasının başlangıç noktası olarak kullanılır ve temel olarak uygulamnın ilk görünümünü viewController'ı oluşturarak(MovieListBuilder ile) oluşturup gösterir.

// Bu kod, uygulamanın başlangıç ekranını (MovieListViewController) bir UINavigationController içinde ayarlayıp, kullanıcıya gösterilmesini sağlar.

// 1. let viewController -> MovieListBuilder.make() çağrısıyla uygulamanın ana ekranını temsil eden MovieListViewController'ı oluşturur.
// 2. Oluşturulan MovieListViewController, bir UINavigationController'ın kök görünüm denetleyicisi (root view controller) olarak ayarlanır. UINavigationController, iOS uygulamalarında hiyerarşik bir navigasyon yapısı sağlar ve geri dönüş (back) gibi navigasyon işlemlerini yönetir.
// 3. UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate ifadesiyle, uygulamanın mevcut aktif sahnesinin (scene) temsilcisine (delegate) erişilir. Bu, iOS 13 ve sonraki sürümlerde uygulamanın yaşam döngüsünü yöneten bir sınıftır.
// 4. sceneDelegate.window?.rootViewController = navigationController ifadesiyle, window'ın kök görünüm denetleyicisi olarak navigationController atanır. Bu, kullanıcıya gösterilecek ilk ekranı belirler.
// 5. sceneDelegate.window?.makeKeyAndVisible() çağrısıyla, pencereyi aktif ve görünür hale getirir. Bu işlem, uygulamanın arayüzünün ekranda görünmesini sağlar.

import UIKit
 
final class AppRouter {
    func start() {
        let viewController = MovieListBuilder.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        if let sceneDelegate = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate) {
            sceneDelegate.window?.rootViewController = navigationController
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
}

