//
//  Score.swift
//  Scores
//
//  Created by Patricia M Espert on 12/11/25.
//

import Foundation

struct Score: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let composer: String
    let year: Int
    let length: Double
    let cover: String
    let tracks: [String]
}

#if DEBUG
extension Score {
    static let test = Score(
        id: 1,
        title: "Star Wars",
        composer: "John Williams",
        year: 1977,
        length: 70.0,
        cover: "StarWars",
        tracks: [
            "Main Title",
            "Imperial Attack",
            "Princess Leia's Theme",
            "The Desert and the Robot Auction",
            "Ben's Death and TIE Fighter Attack",
            "The Little People Work",
            "Rescue of the Princess",
            "Inner City",
            "Cantina Band",
            "The Land of the Sand People",
            "Mouse Robot and Blasting Off",
            "The Return Home",
            "The Walls Converge",
            "The Princess Appears",
            "The Last Battle",
            "The Throne Room and End Title"
        ]
    )
}
#endif

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
