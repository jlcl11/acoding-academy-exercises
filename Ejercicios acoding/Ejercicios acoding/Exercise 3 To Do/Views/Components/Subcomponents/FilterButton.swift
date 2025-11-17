//
//  FilterButton.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import SwiftUI

struct FilterButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .filterButton(isSelected: isSelected)
        }
        .buttonStyle(.plain)
    }
}

#Preview  {
    FilterButton(title: "All", isSelected: true) {}
        .padding()
}

 
