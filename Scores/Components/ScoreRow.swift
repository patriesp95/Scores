//
//  ScoreRow.swift
//  Scores
//
//  Created by Patricia M Espert on 14/11/25.
//

import SwiftUI

struct ScoreRow: View {
    let score: Score

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(score.title)
                    .font(.headline)
                Text(score.composer)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                HStack {
                    Text(score.yearS)
                    Spacer()
                    Text(score.lengthS)
                }
                .font(.caption)
                .padding(.vertical, 5)
            }
            Image(score.cover)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .clipShape(.rect(cornerRadius: 11))
        }
    }
}

#Preview {
    ScoreRow(score: .test)
}
