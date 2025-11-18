//
//  FavoriteSwipeAction.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//


import SwiftUI

struct FavoriteSwipeAction: View {
    let isFavorite: Bool
    let action: () -> Void
    
    private var iconName: String {
        isFavorite ? "star.slash.fill" : "star.fill"
    }
    
    private var label: String {
        isFavorite ? "Unfavorite" : "Favorite"
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Label(label, systemImage: iconName)
        }
        .tint(.yellow)
    }
}

#Preview {
    List {
        Text("Task")
            .swipeActions(edge: .leading) {
                FavoriteSwipeAction(isFavorite: false, action: {})
            }
    }
}
