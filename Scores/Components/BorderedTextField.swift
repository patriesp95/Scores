//
//  BorderedTextField.swift
//  Scores
//
//  Created by Patricia M Espert on 19/11/25.
//

import SwiftUI

struct BorderedTextField: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    let lines: Int
    var action: (() -> Void)?
    
    init(_ placeholder: String,
         label: String,
         text: Binding<String>,
         lines: Int = 1,
         action: (() -> Void)? = nil) {
        self.placeholder = placeholder
        self.label = label
        self._text = text
        self.lines = lines
        self.action = action
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(label)
                .font(.headline)
            HStack(alignment: .firstTextBaseline) {
                TextField(
                    placeholder,
                    text: $text,
                    axis: lines > 1 ? .vertical : .horizontal
                )
                .lineLimit(lines, reservesSpace: true)
                if !text.isEmpty {
                    Button {
                        if let action {
                            action()
                        } else {
                            text = ""
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .symbolVariant(.circle.fill)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .padding(10)
        .background(.gray.opacity(0.1), in: .rect(cornerRadius: 11))
    }
}

#Preview {
    @Previewable @State var text = ""
    BorderedTextField("Enter the title of the score",label: "Title of the score", text: $text)
}
