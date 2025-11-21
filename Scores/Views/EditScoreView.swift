//
//  EditScoreView.swift
//  Scores
//
//  Created by Patricia M Espert on 19/11/25.
//

import SwiftUI

struct EditScoreView: View {
    @EnvironmentObject var scoresVM: ScoresVM
    @ObservedObject var vm: EditScoreVM
    
    var body: some View {
        Form {
            Section {
                BorderedTextField("Enter the title of the score", label: "Title of the score", text: $vm.title,  lines: 2)
                Picker("Select a composer",
                       selection: $vm.composer) {
                    ForEach(scoresVM.composerNames, id: \.self) { composer in
                        Text(composer)
                    }
                }
                .pickerStyle(.menu)
                
                HStack(alignment: .bottom){
                    VStack(alignment: .leading) {
                        Text("Year of the score")
                            .font(.headline)
                        TextField("Enter the year of the release", value:$vm.year, format:.number.precision(.significantDigits(4)))
                    }
                    .layoutPriority(1)
                    
                    VStack(alignment: .leading) {
                        Text("Length")
                            .font(.headline)
                        TextField("Enter the length of the score", value:$vm.length, format:.number.precision(.integerAndFractionLength(integerLimits: 0...3, fractionLimits: 0...1)))
                            .frame(minWidth: 100)
                    }
                }
                .textFieldStyle(.roundedBorder)
            } header: {
                Text("Score info")
            }
        }
        .safeAreaPadding()
    }
}

#Preview {
    EditScoreView(vm: EditScoreVM(score: .test))
        .environmentObject(ScoresVM(repository: RepositoryTest()))
}


