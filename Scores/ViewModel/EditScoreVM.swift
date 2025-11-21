//
//  EditScoreVM.swift
//  Scores
//
//  Created by Patricia M Espert on 19/11/25.
//

import Combine
import SwiftUI

final class EditScoreVM: ObservableObject {

    let score: Score

    @Published var title = ""
    @Published var composer = ""
    @Published var year = 0
    @Published var length = 0.0
    @Published var cover = ""
    @Published var tracks: [String] = []
    
    @Published var showAlert = false
    @Published var errorMsg = ""

    init(score: Score) {
        self.score = score
        initData()
    }

    func initData() {
        title = score.title
        composer = score.composer
        year = score.year
        length = score.length
        cover = score.cover
        tracks = score.tracks
    }
    
    func validate() -> Score? {
        var isValid = true
        var errors: [String] = []
        
        // Validar título
        if title.trimmingCharacters(in: .whitespaces).isEmpty {
            errors.append("El título no puede estar vacío")
            isValid = false
        }
        
        // Validar año
        if year < 1900 || year > 2100 {
            errors.append("El año debe estar entre 1900 y 2100")
            isValid = false
        }
        
        // Validar duración
        if length <= 0 {
            errors.append("La duración debe ser mayor que 0")
            isValid = false
        }
        
        // Validar tracks
        let validTracks = tracks.filter { !$0.trimmingCharacters(in: .whitespaces).isEmpty }
        if validTracks.isEmpty {
            errors.append("Debe haber al menos un track válido")
            isValid = false
        }
        
        if !isValid {
            errorMsg = errors.joined(separator: "\n")
            showAlert = true
            return nil
        } else {
            return Score(id: score.id,
                         title: title,
                         composer: composer,
                         year: year,
                         length: length,
                         cover: cover,
                         tracks: tracks)
        }
    }

}

#Preview {
    NavigationStack {
        EditScoreView(vm: EditScoreVM(score: .test))
            .environmentObject(ScoresVM(repository: RepositoryTest()))
    }
}
