//
//  SectionHeader.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import SwiftUI

struct SectionHeader: View {
    let category: Task.Category
    
    var body: some View {
        HStack(spacing: ToDoConstants.iconSpacing) {
            Image(systemName: category.icon)
                .categoryIcon()
            Text(category.rawValue)
        }
        .sectionHeader()
    }
}

#Preview {
    SectionHeader(category: .personal)
        .padding()
}

 
