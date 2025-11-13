//
//  DataRepository.swift
//  Scores
//
//  Created by Patricia M Espert on 12/11/25.
//

import Foundation

protocol DataRepository {
    var url: URL { get }
    func load() throws -> [Score]
    func save(scores: [Score]) throws
}

extension DataRepository {
    func load() throws -> [Score] {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Score].self, from: data)
    }
    
    func save(scores: [Score]) throws {
        let data = try JSONEncoder().encode(scores)
        try data.write(to: url, options: .atomic) // avoids data race
    }
}
