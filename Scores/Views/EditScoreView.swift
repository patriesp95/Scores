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
        VStack {
            TextField("Enter the title of the score", text: $vm.title, axis: .vertical)
                .lineLimit(2, reservesSpace: true)
            TextField("Enter the composer of the score", text: $vm.composer)
            TextField("Enter the year of the release", value:$vm.year, format:.number.precision(.significantDigits(4)))
        }
        .safeAreaPadding()
    }
}

/*
 
 @State private var fecha = Date.now

 TextField("Enter the date (DD/MMMM/YYYY)", value: $fecha, format: .dateTime.day(.twoDigits).month(.twoDigits).year(.defaultDigits))
 
 
 */

#Preview {
    EditScoreView(vm: EditScoreVM(score: .test))
}


