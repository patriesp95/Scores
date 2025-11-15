//
//  ContentView.swift
//  Scores
//
//  Created by Patricia M Espert on 12/11/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = ScoresVM()
    
    @State private var showInsert = false
    @State private var detents: PresentationDetent = .fraction(0.20)
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.scores) { score in
                    ScoreRow(score: score)
                }
                .onDelete(perform: vm.delete)
            }
            .listStyle(.grouped)
            .navigationTitle("Scores")
            .insertButton(show: $showInsert)
            .sheet(isPresented: $showInsert) {
                AddScoreView()
                    .presentationDetents([.fraction(0.20), .medium, .large], selection: $detents)
                    .presentationDragIndicator(.visible)
                    .presentationBackgroundInteraction(.enabled)
            }
        }
    }
}

#Preview {
    ContentView(vm: ScoresVM(repository: RepositoryTest()))
}
