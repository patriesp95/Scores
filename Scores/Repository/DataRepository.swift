//
//  DataRepository.swift
//  Scores
//
//  Created by Patricia M Espert on 12/11/25.
//

import Foundation

protocol DataRepository {
    func load() throws -> [Score]
    func save(scores: [Score]) throws
}
