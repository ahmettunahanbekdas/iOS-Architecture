//
//  TopMovieResponse.swift
//  MovieBoxAPI
//
//  Created by Ahmet Tunahan Bekdaş on 30.08.2024.
//

// ????? enum, struct, throw try, self, init deinit,

// P.8

// DF.4 -> TopMovieResponse -> fetchData() fonksiyonunda attığımız request'den dönen  JSON formatındaki respose'muzu alır ve bu veriyi anlanlı bir yapıya çevirir.
// RootCodingKeys: Bu enum String tipini temel alır. Bu, her bir enum değerinin String olarak değerleneceği anlamına gelir, yani case feed aslında "feed" string'ine karşılık gelir.
// CodingKey -> CodingKey protokolü, JSON verisini Decodable protokolü işe decode ederken kullanılır. Bu protokol, Swift'in hangi anahtarın JSON verisinden hangi veriyle eşleştiriliceğini bilmesini sağlar
// FeedCodingKeys -> Bu enum feed anahtarının altında ki veriyi tanımlamak için kullanılır
// Bu enum yine Strinh tipini temel alır. Bu, her bir enum değerinin bir String olarak değerlendiriliceğinin anlamına gelir.
// case results: Bu, JSON verisinde "results" adında bir alt anahtar olduğunu ifade eder. Bu anahtar, "feed" anahtarının içinde bulunur ve FeedCodingKeys enum'ında case results olarak tanımlanır.
// init(from decoder: Decoder) throws: TopMovieResponse'un özel bir initializer(başlatıcı)'ı ve Decodable protokülüne uyan bir yapı alır. Bu method dışarıdan gelen veriyi (Decoder objesi) alır ve bu veriyi TopMovieResponse nesnesine dönüştürür.
// let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self): Burada decoder, JSONDecoder tarafında sağnana bir nesnedir, dışarıdan JSON verisi alır, container(keyedBy:) metodu, JSON verisindeki en üst düzeydeki (root) anahtarlar (keys) ile çalışabilmemizi sağlar. RootCodingKeys.self enum'ını kullanarak, hangi anahtarları aradığımızı belirtiyoruz. Bu durumda, RootCodingKeys enum'ında tanımlanan feed anahtarı kullanılır. rootContainer, JSON verisinin en üst düzeydeki (root) anahtarlarını içeren bir konteynerdir.
// let feedContainer = try rootContainer.nestedContainer(keyedBy: FeedCodingKeys.self, forKey: .feed): -> rootContainer içindeki feed anahtarının içeriğini almak istiyoruz. nestedContainer(keyedBy:forKey:) metodu, belirtilen anahtar (feed) altındaki diğer anahtarları içeren yeni bir konteyner oluşturur. Bu, JSON verisindeki iç içe geçmiş (nested) yapılarla çalışmamızı sağlar. FeedCodingKeys.self enum'ını kullanarak, feed altında bulunan results anahtarını alıyoruz. feedContainer, feed anahtarının altındaki results anahtarını içerir.
// self.results = try feedContainer.decode([Movie].self, forKey: .results): -> feedContainer içindeki results anahtarının değerini almak ve bunu Movie türündeki bir diziye (array) dönüştürmek istiyoruz. decode(_:forKey:) metodu, belirtilen anahtar (results) altındaki veriyi decode eder ve bunu [Movie] türüne dönüştürür. self.results, TopMovieResponse'un results özelliğidir ve burada decode edilen Movie nesnelerinin listesini alır.
// Yani, bu adımda JSON verisindeki results anahtarının altındaki tüm filmleri alıyoruz ve bunları Movie yapısına dönüştürüyoruz.





import Foundation

public struct TopMovieResponse: Decodable {
    
    private enum RootCodingKeys: String, CodingKey  {
        case feed
    }
    
    private enum FeedCodingKeys: String, CodingKey {
        case results
    }
    
    public let results: [Movie]

    
    init(movies: [Movie]) {
        self.results = movies
    }
    
    public init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        let feedContainer = try rootContainer.nestedContainer(keyedBy: FeedCodingKeys.self, forKey: .feed)
        self.results = try feedContainer.decode([Movie].self, forKey: .results)
    }
}




