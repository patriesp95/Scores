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
    
    @Published var search = ""
    
    var scoresFiltered: [Score] {
        scores.filter {
            search.isEmpty || $0.title.range(of: search, options: [.caseInsensitive, .diacriticInsensitive]) != nil
        }
    }
    
    var scoresByComposer: [[Score]] {
        Dictionary(grouping: scores) { score in
            score.composer
        }.values.sorted { s1, s2 in
            s1.first?.composer ?? "" <= s2.first?.composer ?? ""
        }
    }
    
    var composers: [Composers] {
        Set(scores.map(\.composer)).sorted().map { composer in
            Composers(composer: composer,
                      scores: scores.filter { $0.composer == composer }
                .filter{ search.isEmpty || $0.title.range(of: search, options: [.caseInsensitive, .diacriticInsensitive]) != nil })
        }
    }
    
    init(repository: DataRepository = Repository()) {
        self.repository = repository
        do {
            self.scores = try repository.loadScores()
        } catch {
            self.scores = []
            print(error)
        }
    }
    
    func delete(indexSet: IndexSet) {
        scores.remove(atOffsets: indexSet)
    }
}
