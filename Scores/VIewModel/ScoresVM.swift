//
//  ScoresVM.swift
//  Scores
//
//  Created by Patricia M Espert on 13/11/25.
//

import SwiftUI
import Combine

final class ScoresVM: ObservableObject {
    @Published var scores: [Score]
    private let repository: DataRepository
    
    init(repository: DataRepository = Repository()) {
        self.repository = repository
        do {
            self.scores = try repository.load()
        } catch {
            self.scores = []
            print(error)
        }
    }
}
