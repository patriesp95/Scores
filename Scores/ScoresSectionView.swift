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
            list3
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

    var list1: some View {
        List {
            ForEach(vm.scoresByComposer, id: \.self) { scores in
                Section {
                    ForEach(scores) { score in
                        ScoreRow(score: score)
                    }
                } header: {
                    Text(scores.first?.composer ?? "")
                }
            }
            .onDelete(perform: vm.delete)
        }
    }
    
    var list2: some View {
        List {
            ForEach(vm.composers) { composer in
                Section {
                    ForEach(composer.scores) { score in
                        ScoreRow(score: score)
                    }
                } header: {
                    Text(composer.composer)
                }
            }
            .onDelete(perform: vm.delete)
        }
    }
    
    var list3: some View {
        ScrollView {
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                ForEach(vm.composers) { composer in
                    if !composer.scores.isEmpty {
                        Section {
                            ForEach(composer.scores) { score in
                                ScoreRow2(score: score)
                            }
                        } header: {
                            ComposerHeader(composer: composer.composer)
                        }
                    }
                }
                .onDelete(perform: vm.delete)
            }
        }
        .scrollIndicators(.hidden)
        .safeAreaPadding()
    }
}

#Preview {
    ScoresSectionView(vm: ScoresVM(repository: RepositoryTest()))
}
