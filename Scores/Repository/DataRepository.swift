//
//  DataRepository.swift
//  Scores
//
//  Created by Patricia M Espert on 12/11/25.
//

import Foundation

protocol DataRepository: JSONLoader {
    func loadScores() throws -> [Score]
    func saveScores(_ scores: [Score]) throws
}

extension DataRepository {
    func loadScores() throws -> [Score] {
        try load(type: [Score].self)
    }
    
    func saveScores(_ scores: [Score]) throws {
        try save(data: scores)
    }
}
