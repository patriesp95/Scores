//
//  Score.swift
//  Scores
//
//  Created by Patricia M Espert on 12/11/25.
//

import Foundation

struct Score: Codable, Identifiable {
    let id: Int
    let title: String
    let composer: String
    let year: Int
    let length: Double
    let cover: String
    let tracks: [String]
}

// truco del almendruco si hubiese ids duplicados
//struct Score: Codable {
//    let id = UUID()
//    let idMaldito: Int
//    let title: String
//    let composer: String
//    let year: Int
//    let length: Double
//    let cover: String
//    let tracks: [String]
//
//    enum CodingKeys: String, CodingKey {
//        case title, composer, year, length, cover, tracks
//        case idMaldito = "id"
//    }
//}
