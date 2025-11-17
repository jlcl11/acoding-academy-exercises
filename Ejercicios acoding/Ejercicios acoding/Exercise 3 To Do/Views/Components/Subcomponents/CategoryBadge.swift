//
//  CategoryBadge.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import SwiftUI

struct CategoryBadge: View {
    let category: Task.Category
    
    var body: some View {
        HStack(spacing: ToDoConstants.smallSpacing) {
            Image(systemName: category.icon)
                .smallIcon()
            Text(category.rawValue)
                .font(.caption2)
        }
        .categoryBadge()
    }
}

#Preview {
    CategoryBadge(category: .personal)
        .padding()
}

 
