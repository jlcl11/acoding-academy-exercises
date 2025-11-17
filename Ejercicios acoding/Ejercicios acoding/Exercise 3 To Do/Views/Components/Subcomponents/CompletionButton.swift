//
//  CompletionButton.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import SwiftUI

struct CompletionButton: View {
    let isCompleted: Bool
    let action: () -> Void
    
    private var iconName: String {
        isCompleted ? "checkmark.circle.fill" : "circle"
    }
    
    var body: some View {
        Button(action: action) {
            Image(systemName: iconName)
                .completionButton(isCompleted: isCompleted)
        }
        .buttonStyle(.plain)
    }
}

#Preview  {
    CompletionButton(isCompleted: false) {
        print("Toggle completion")
    }
    .padding()
}


