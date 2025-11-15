//
//  AddScoreView.swift
//  Scores
//
//  Created by Patricia M Espert on 15/11/25.
//

import SwiftUI

struct AddScoreView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Text("Hello, World!")
                .navigationTitle("Add Score")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem {
                        Button(role: .close) {
                            dismiss()
                        } label: {
                            Label("Close", systemImage: "xmark")
                        }
                    }
                }
        }
    }
}

#Preview {
    AddScoreView()
}
