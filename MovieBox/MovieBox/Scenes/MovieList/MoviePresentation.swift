//
//  MoviePresentation.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 2.09.2024.
//

// ?????

// MoviePresentation Katmanı Nedir -> Bir Presentation layer oluşturmak için kullanılıyor ve iki farklı init() sahip. Amacı ise bir film hakkında ki başlık ve detay sayfalarını saklayan bir modeldir. verilerin View' de nasıl gösterileceği ile ilgilenir.

// Initializers -> sınıfın bir örneği oluşturulurken kullanılan özel fonksiyonlardır adı üstünde de bizim sınıfımızın başlatılmasında görev alırlar, bu sınıf iki adet başlatıcıya ship durumda temel başlatıcı(init) ve convenience init

// 1. Temel init() Ne yapar? -> MoviePresentation objesini doğrudan başlatmak için kullanılır. Başlık ve detay bilgilerini alır ve sınıfın ilgili özelliklerine atar

// 2. convenience init() Ne yapar? -> Ne Yapar?: Bu başlatıcı, doğrudan Movie model nesnesinden bir MoviePresentation nesnesi oluşturur. Yani, bir Movie nesnesini kullanarak title ve detail gibi bilgileri alır ve temel başlatıcıyı kullanarak bu bilgileri sınıfın ilgili özelliklerine atar.
// Neden iki adet başlatıcı var -> Esneklik sağlama -> Farklı kaynaklardan (örneğin bir Movie nesnesinde, veya direkt temel başlatıcıdan) direkt olarak MoviePresentation objesi oluşturabiliriz, Convenience başlatıcı, Movie modelini kullanarak daha kolay ve hızlı bir nesne oluşturmayı sağlar.
// Kod tekrarını önleme -> convenience init, temel başlatıcıyı çağırarak kodun tekrarını önler. Yani movie.name! ve movie.artistName! gibi verileri elle alıp işlemek yerine, bunları doğrudan temel başlatıcıya ileterek işini kolaylaştırır.

import Foundation
import MovieBoxAPI

class MoviePresentation: NSObject {
    let title: String
    let detail: String
 
   init(title: String, detail: String) {
      self.title = title
      self.detail = detail
  }
    
    convenience init(movie: Movie) {
        self.init(title: movie.name!, detail: movie.artistName!)
    }
}


