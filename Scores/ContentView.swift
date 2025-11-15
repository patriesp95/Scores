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
    @State private var detents: PresentationDetent = .medium
    @State private var searchPresent = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.scoresFiltered) { score in
                    ScoreRow(score: score)
                }
                .onDelete(perform: vm.delete)
            }
            .listStyle(.grouped)
            .navigationTitle("Scores")
            .searchable(
                text: $vm.search,
                isPresented: $searchPresent,
                prompt: "Search for a score by title"
            )
            .insertButtonV2 {
                showInsert.toggle()
            }
            .sheet(isPresented: $showInsert) {
                AddScoreView()
                    .presentationDetents(
                        [.medium, .large],
                        selection: $detents
                    )
                    .presentationDragIndicator(.visible)
                    .presentationBackgroundInteraction(.enabled)
            }
        }
    }
}

#Preview {
    ContentView(vm: ScoresVM(repository: RepositoryTest()))
}
