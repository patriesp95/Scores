//
//  AddScoreView.swift
//  Scores
//
//  Created by Patricia M Espert on 15/11/25.
//

import SwiftUI

struct AddScoreView: View {
    
    var body: some View {
        NavigationStack {
            Text("Hello, World!")
                .navigationTitle("Add Score")
                .navigationBarTitleDisplayMode(.inline)
                .closeButton
                
        }
    }
}

#Preview {
    AddScoreView()
}
