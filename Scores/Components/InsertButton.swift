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
                        Image(systemName: "plus")
                            .rotationEffect(showInsert ? .degrees(-45) : .degrees(.zero))
                    }
                }
            }
    }
}

fileprivate struct InsertButtonV2: ViewModifier {
    let callback: () -> Void
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem {
                    Button {
                        callback()
                    } label: {
                        Label("Insertar", systemImage: "plus")
                    }
                }
            }
    }
}

extension View {
    func insertButtonV1(show: Binding<Bool>) -> some View {
       modifier(InsertButtonV1(showInsert: show))
    }
    
    func insertButtonV2(callback: @escaping () -> Void) -> some View {
        modifier(InsertButtonV2(callback: callback))
    }
}
