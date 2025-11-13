//
//  DataRepository.swift
//  Scores
//
//  Created by Patricia M Espert on 12/11/25.
//

import Foundation

protocol DataRepository: JSONLoader {
    func load() throws -> [Score]
    func save(scores: [Score]) throws
}

extension DataRepository {
    func load() throws -> [Score] {
        try load(type: [Score].self)
    }
    
    func save(scores: [Score]) throws {
        try save(scores: scores)
    }
}
