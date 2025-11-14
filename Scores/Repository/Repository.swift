//
//  Repository.swift
//  Scores
//
//  Created by Patricia M Espert on 12/11/25. 
//

import Foundation

struct Repository: DataRepository {
    var url: URL {
        Bundle.main.url(forResource: "scoresdata", withExtension: "json")!
    }
}

struct RepositoryTest: DataRepository {
    var url: URL {
        Bundle.main.url(forResource: "scoresdatatest", withExtension: "json")!
    }
    
    func saveScores(_ scores: [Score]) throws {
        print("We have tried to retrieve \(scores.count).")
    }
}
