//
//  ScoreRow.swift
//  Scores
//
//  Created by Patricia M Espert on 14/11/25.
//

import SwiftUI

struct ScoreRow2: View {
    let score: Score
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(score.title)
                        .font(.title3)
                        .bold()
                    Text(score.composer)
                        .font(.body)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Image(score.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .clipShape(.rect(cornerRadius: 11))
                
            }
            HStack {
                Text(score.yearS)
                           Spacer()
                Text(score.lengthS)
            }
            .font(.footnote)
            .padding(.vertical, 2)
        }
        .padding()
        .background(.cyan, in: .rect(cornerRadius: 11, style: .continuous))
    }
}

#Preview {
    ScoreRow2(score: .test)
}
