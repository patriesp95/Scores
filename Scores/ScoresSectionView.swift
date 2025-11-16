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
            list2
                .navigationTitle("Scores")
                .searchable(
                    text: $vm.search,
                    isPresented: $searchPresent,
                    prompt: "Search for a score by title"
                )
                .navigationDestination(for: Score.self) { score in
                    ScoreDetailView(score: score)
                }
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
                        NavigationLink(value: score) {
                            ScoreRow(score: score)
                        }
                    }
                    .onDelete { index in
                        vm.deleteRow(composer: composer.composer, indexSet: index)
                    }
                    .swipeActions(edge: .leading){
                        Button {
                            
                        } label: {
                            Image(systemName: "star")
                        }
                        .tint(.yellow)
                    }
                } header: {
                    Text(composer.composer)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Menu {
                    ForEach(Arrangement.allCases) { order in
                        Button {
                            vm.order = order
                        } label : {
                            HStack(spacing: 16) {
                                Text(order.rawValue)
                                Spacer()
                                Label(order.rawValue, systemImage: order.systemImageName)
                            }
                        }
                        .padding(8)
                    }
                } label: {
                    Label("Arrange", systemImage: "square.stack.fill")
                }

            }
        }
        .alert("Deleting Scores", isPresented: $vm.showAlert) {
            Button(role: .cancel) {} label: {
                Text("Cancel")
            }
            
            Button(role: .destructive){
                vm.deletePendingScore()
            } label: {
                Text("Delete")
            }
        } message : {
            Text(vm.msg)
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
                            .onDelete(perform: vm.delete)
                            .swipeActions(edge: .leading){
                                Button {
                                    
                                } label: {
                                    Image(systemName: "star")
                                }
                                .tint(.yellow)

                            }
                        } header: {
                            ComposerHeader(composer: composer.composer)
                        }
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .safeAreaPadding()
    }
    
    var list4: some View {
        ScrollView {
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                ForEach(vm.scores) { score in
                    ScoreRow2(score: score)
                        .contextMenu {
                            Button {
                                
                            } label: {
                                Label("Favorite", systemImage: "star")
                            }
                            .tint(.yellow)

                            Button(role: .destructive){
                                
                            } label: {
                                Label("Delete", systemImage: "trash")

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
