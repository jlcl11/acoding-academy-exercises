//
//  SecondaryButton.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import SwiftUI

struct SecondaryButton: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack(spacing: ToDoConstants.iconSpacing) {
            Image(systemName: icon)
                .font(.subheadline)
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
        }
        .secondaryButton()
    }
}

#Preview  {
    SecondaryButton(icon: "arrow.up.arrow.down", title: "Sort")
        .padding()
}
