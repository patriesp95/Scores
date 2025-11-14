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
        NavigationStack {
            List(vm.scores) { score in
                ScoreRow(score: score)
            }
            .listStyle(.grouped)
            .navigationTitle("Scores")
            .toolbar {
                ToolbarItem {
                    Button {
                        
                    } label: {
                        Label("Insertar", systemImage: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(vm: ScoresVM(repository: RepositoryTest()))
}
