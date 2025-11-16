//
//  ScoresVM.swift
//  Scores
//
//  Created by Patricia M Espert on 13/11/25.
//

import SwiftUI
import Combine

enum Arrangement: String, Identifiable, CaseIterable {
    case none = "None"
    case ascended = "Ascending"
    case descended = "Descending"
    
    var id: Self { self }
    
    var systemImageName: String {
        switch self {
            case .none:      return "arrow.clockwise"
            case .ascended:  return "arrow.up"
            case .descended: return "arrow.down"
        }
    }
}

final class ScoresVM: ObservableObject {
    @Published var scores: [Score]
    private let repository: DataRepository
    
    @Published var search = ""
    
    @Published var showAlert = false
    @Published var msg = ""
    
    @Published var order: Arrangement = .none
    
    private var scoreToDelete: Score?
    
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
                .filter {
                    search.isEmpty || $0.title.range(of: search, options: [.caseInsensitive, .diacriticInsensitive]) != nil
                }
                .sorted {
                    switch order {
                    case .none:
                        $0.id < $1.id
                    case .ascended:
                        $0.title < $1.title
                    case .descended:
                        $0.title > $1.title
                    }
                }
            )
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
    
    func deleteRow(composer: String, indexSet: IndexSet) {
        if let index = indexSet.first, let scoresComposer = composers.first(where: { $0.composer == composer})?.scores {
            let score = scoresComposer[index]
            msg = "Are you sure about deleting \(score.title)'s score?"
            showAlert.toggle()
            scoreToDelete = score
        }
    }
    
    func deletePendingScore(){
        if let scoreToDelete {
            scores.removeAll(where: { $0.id == scoreToDelete.id })
        }
    }
}
