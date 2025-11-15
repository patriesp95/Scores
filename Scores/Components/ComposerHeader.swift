//
//  ComposerHeader.swift
//  Scores
//
//  Created by Patricia M Espert on 16/11/25.
//

import SwiftUI

struct ComposerHeader: View {
    let composer: String
    var body: some View {
        HStack {
            Text(composer)
                .font(.title)
            Spacer()
            Image(composer)
                .resizable()
                .scaledToFit()
                .frame(width: 60)
                .clipShape(Circle())
        }
        .padding(.vertical, 10)
        .background(.ultraThinMaterial, in: .rect)
    }
}

#Preview {
    ComposerHeader(composer: Score.test.composer)
}
