//
//  EditScoreView.swift
//  Scores
//
//  Created by Patricia M Espert on 19/11/25.
//

import SwiftUI

struct EditScoreView: View {
    @ObservedObject var vm: EditScoreVM
    
    var body: some View {
        VStack{
            BorderedTextField("Enter the title of the score", text: $vm.title,  lines: 2)
            BorderedTextField("Enter the composer of the score", text: $vm.composer)
            TextField("Enter the year of the release", value:$vm.year, format:.number.precision(.significantDigits(4)))
        }
    }
}

#Preview {
    EditScoreView(vm: EditScoreVM(score: .test))
}


