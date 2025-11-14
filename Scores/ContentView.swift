//
//  ContentView.swift
//  Scores
//
//  Created by Patricia M Espert on 12/11/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = ScoresVM()
    
    var body: some View {
        List(vm.scores) { score in
            HStack {
                VStack(alignment: .leading){
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
}

#Preview {
    ContentView(vm: ScoresVM(repository: RepositoryTest()))
}
