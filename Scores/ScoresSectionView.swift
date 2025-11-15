//
//  ScoresSectionView.swift
//  Scores
//
//  Created by Patricia M Espert on 15/11/25.
//

import SwiftUI

struct ScoresSectionView: View {
    @ObservedObject var vm = ScoresVM()

    @State private var showInsert = false
    @State private var detents: PresentationDetent = .medium
    @State private var searchPresent = false

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Print(vm.scoresByComposer)
                }
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

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}


#Preview {
    ScoresSectionView()
}
