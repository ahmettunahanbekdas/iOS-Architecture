//
//  SceneDelegate.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 29.08.2024.
//

//SceneDelegate sınıfı, iOS uygulamasının kullanıcı arayüzü sahnelerini yönetir ve uygulamanın yaşam döngüsü olaylarına yanıt verir. Her bir metod, sahnenin yaşam döngüsündeki farklı aşamaları yönetmek için kullanılır ve uygulamanın kullanıcı etkileşimlerine uygun şekilde tepki vermesini sağlar.

// ????? Bundle, Type Casting, Dependency Injection,

// P.1 -> SceneDelegate sınıfı, iOS uygulamasının kullanıcı arayüzü sahnelerini yönetir ve uygulamanın yaşam döngüsü olaylarına yanıt verir. Her bir metod, sahnenin yaşam döngüsündeki farklı aşamaları yönetmek için kullanılır ve uygulamanın kullanıcı etkileşimlerin

// 1. window: Uygulamanın ana penceresi. UIWindow türünde bir optional özelliktir ve uygulamanın ana görünümünü (user interface) barındırır.
// 2. func scene: Bu metod, sahne (scene) ilk kez oluşturulduğunda çağrılır. Genellikle uygulamanın ana penceresini başlatmak ve ilk ekranı ayarlamak için kullanılır.
// 3. Yeni bir UIWindow nesnesi oluşturur ve onu sahneye atar.
// 4. start(): Uygulamanın başlangıç noktası belirlenir. Bu genellikle uygulamanın ilk ekranını veya ana görünümünü yükler.


import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        app.router.start()
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {

    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
       
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
       
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
}

//        let viewController = MovieListBuilder.make()
//        let navigationController = UINavigationController(rootViewController: viewController)
//
//        window?.rootViewController = navigationController
//        window?.makeKeyAndVisible()
//
