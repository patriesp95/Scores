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
            Text(score.title)
        }
    }
}

#Preview {
    ContentView(vm: ScoresVM(repository: RepositoryTest()))
}
