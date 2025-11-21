//
//  ScoresListView.swift
//  Scores
//
//  Created by Patricia M Espert on 21/11/25.
//


import SwiftUI

struct ScoresListView: View {
    @EnvironmentObject private var vm: ScoresVM
    @State private var showInsert = false
    @State private var detents: PresentationDetent = .medium
    @State private var searchPresent = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.composers) { composer in
                    Section {
                        ForEach(composer.scores, id: \.id) { score in
                            NavigationLink(value: score) {
                                ScoreRow(score: score)
                            }
                        }
                        .onDelete { index in
                            vm.deleteRow(composer: composer.composer,
                                         indexSet: index)
                        }
                        .swipeActions(edge: .leading) {
                            Button {

                            } label: {
                                Label("Make Favorite", systemImage: "star")
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
                        ForEach(Arrangement.allCases, id: \.id) { order in
                            Button {
                                vm.order = order
                            } label: {
                                HStack {
                                    Text(order.rawValue)
                                    if vm.order == order {
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                        }
                    } label: {
                        Label("Arrange", systemImage: "square.stack.fill")
                    }
                }
            }
            .alert("Score delection",
                   isPresented: $vm.showAlert) {
                Button(role: .cancel) {} label: {
                    Text("Cancel")
                }
                Button(role: .destructive) {
                    withAnimation {
                        vm.deletePendingScore()
                    }
                } label: {
                    Text("Delete")
                }
            } message: {
                Text(vm.msg)
            }
            .navigationTitle("Scores")
            .searchable(text: $vm.search,
                        isPresented: $searchPresent,
                        prompt: Text("Insert title to look for"))
            .navigationDestination(for: Score.self) { score in
                EditScoreView(vm: EditScoreVM(score: score))
            }
            .toolbarButton {
                showInsert.toggle()
            } label: {
                Label("Insertar", systemImage: "plus")
            }
            .fullScreenCover(isPresented: $showInsert) {
                AddScoreView()
            }
        }
    }
}

#Preview {
    ScoresListView()
        .environmentObject(ScoresVM(repository: RepositoryTest()))
}
