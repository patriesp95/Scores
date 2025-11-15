//
//  CloseButton.swift
//  Scores
//
//  Created by Patricia M Espert on 15/11/25.
//

import SwiftUI

fileprivate struct CloseButton: ViewModifier {
    @Environment(\.dismiss) private var dismiss

    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem {
                    if #available(iOS 26.0, *) {
                        Button(role: .close) {
                            dismiss()
                        } label: {
                            Label("Close", systemImage: "xmark")
                        }
                    } else {
                        Button {
                            dismiss()
                        } label: {
                            Label("Close", systemImage: "xmark")
                        }
                    }
                }
            }
    }
}

extension View {
    var closeButton: some View {
        modifier(CloseButton())
    }
}
