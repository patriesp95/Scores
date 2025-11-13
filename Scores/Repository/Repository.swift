//
//  Repository.swift
//  Scores
//
//  Created by Patricia M Espert on 12/11/25. 
//

import Foundation

struct Repository: DataRepository {
    func load() throws -> [Score] {
        guard let url = Bundle.main.url(forResource: "scoresdata", withExtension: "json") else { return []}
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Score].self, from: data)
    }
    
    func save(scores: [Score]) throws {
        let url = URL.documentsDirectory.appending(path: "scoresdata.json")
        let data = try JSONEncoder().encode(scores)
        try data.write(to: url, options: .atomic) // avoids data race
    }
}


struct RepositoryTest: DataRepository {
    func load() throws -> [Score] {
        guard let url = Bundle.main.url(forResource: "scoresdatatest", withExtension: "json") else { return []}
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Score].self, from: data)
    }
    
    func save(scores: [Score]) throws {
        print("Se han intentado guardar \(scores.count).")
    }
}
