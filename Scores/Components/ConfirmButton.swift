//
//  ConfirmButton.swift
//  Scores
//
//  Created by Patricia M Espert on 21/11/25.
//

import SwiftUI

fileprivate struct ConfirmButton: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                if #available(iOS 26.0, *) {
                    ToolbarItem {
                        Button(role: .confirm) {
                            action()
                        } label : {
                            Label("Accept", systemImage: "checkmark")
                        }
                    }
                } else {
                    ToolbarItem {
                        Button {
                            action()
                        } label : {
                            Label("Accept", systemImage: "checkmark")
                        }
                    }
                }
            }
    }
}

extension View {
    func confirmButton(action: @escaping () -> Void) -> some View {
        modifier(ConfirmButton(action: action))
    }
}
