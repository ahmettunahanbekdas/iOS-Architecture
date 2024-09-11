//
//  Decoders.swift
//  MovieBoxAPI
//
//  Created by Ahmet Tunahan Bekdaş on 29.08.2024.
//

// ????? enum, property type, closure, static

// P.7

// DF.3 -> Decoders -> Bu kod, JSON verilerini Date nesnelerine dönüştürmek için kullanılan bir JSONDecoder nesnesi oluşturur. DateFormatter kullanarak belirli bir tarih formatını ("yyyy-MM-dd") tanımlar ve bu formatı kullanarak JSON içindeki tarih verilerini doğru bir şekilde ayrıştırır.
// JSONDecoder JSON datasını Swift objelerine dönüştürmek için kullanılır(class, struct, enum)(Oluşturduğumuz model yapısı vb)
// Biz JSONDecoder nesnemize Data tipini dönüştürebileceği bir hale getirdik
// public enum Decoders: -> Decoders adında bir enum (sınıflandırma) tanımlanıyor. Enum, genellikle bir grup ilişkili sabiti ve işlevi bir arada tutmak için kullanılır
// public static let plainDateDecoder: -> plainDateDecoder adında bir değişken tanımlanıyor. Bu değişken static olarak işaretlenmiş, yani sınıfın (bu durumda enum'un) kendisine ait bir özelliktir ve sınıfın tüm örnekleri arasında paylaşılan bir nesnedir.
// { ... }(): -> Bu yapı, bir closure (kapanış) olarak adlandırılır. Closure, bir kod bloğunun bir değişken gibi kullanılmasını sağlar ve genellikle bir işlevi tanımlamak ve hemen çalıştırmak için kullanılır.
// Bu closure, plainDateDecoder'ın bir JSONDecoder nesnesi oluşturmasını ve yapılandırmasını sağlar.
// let decoder = JSONDecoder(): -> JSON verilerini swift objelerine döüştürmeye yarayan bir sınıftır.
// let dateFormatter = DateFormatter(): -> Bu nesne, tarih ve zaman verilerini belirli bir formatta biçimlendirmek ve ayrıştırmak için kullanılır.
//  DateFormatter nesnesi oluşturulur. Bu nesne, tarihlerin nasıl formatlanacağını belirtir. dateFormatter.dateFormat = "yyyy-MM-dd" ifadesi, tarihlerin JSON verisinde "yıl-ay-gün" formatında olduğunu belirtir.
// decoder.dateDecodingStrategy = .formatted(dateFormatter) ifadesi, JSONDecoder'a tarihleri DateFormatter kullanarak nasıl dönüştüreceğini belirtir.
import Foundation

public enum Decoders {
   public static let plainDateDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
}
