//
//  StorySection.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//


import SwiftUI

struct StorySection: View {
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: SuperHeroStyles.Spacing.small) {
            Label("Story", systemImage: "book.fill")
                .sectionTitleStyle()
            
            Text(description)
                .font(.body)
                .foregroundColor(.secondary)
                .lineSpacing(6)
        }
    }
}
