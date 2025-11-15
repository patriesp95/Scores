//
//  AddScoreView.swift
//  Scores
//
//  Created by Patricia M Espert on 15/11/25.
//

import SwiftUI

struct AddScoreView: View {
    @Binding var showInsert: Bool
    
    var body: some View {
        NavigationStack {
            Text("Hello, World!")
                .navigationTitle("Add Score")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem {
                        Button(role: .close) {
                            showInsert.toggle()
                        } label: {
                            Label("Close", systemImage: "xmark")
                        }
                    }
                }
        }
    }
}

#Preview {
    @Previewable @State var showInsert = true
    AddScoreView(showInsert: $showInsert)
}
