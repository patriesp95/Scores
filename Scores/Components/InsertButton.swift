//
//  InsertButton.swift
//  Scores
//
//  Created by Patricia M Espert on 15/11/25.
//

import SwiftUI

fileprivate struct InsertButtonV1: ViewModifier {
    @Binding var showInsert: Bool
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem {
                    Button {
                        showInsert.toggle()
                    } label: {
                        Label("Insertar", systemImage: "plus")
                    }
                }
            }
    }
}

extension View {
    func insertButton(show: Binding<Bool>) -> some View {
       modifier(InsertButtonV1(showInsert: show))
    }
}
