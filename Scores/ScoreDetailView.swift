//
//  ScoreDetailView.swift
//  Scores
//
//  Created by Patricia M Espert on 16/11/25.
//
import SwiftUI

struct ScoreDetailView: View {
    let score: Score
    
    var body: some View {
        Text(score.title)
    }
}

#Preview {
    ScoreDetailView(score: .test)
}
