//
//  FavoriteIcon.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import SwiftUI

struct FavoriteIcon: View {
    var body: some View {
        Image(systemName: "star.fill")
            .favoriteIcon()
    }
}

#Preview {
    FavoriteIcon()
        .padding()
}

#Preview {
    HStack {
        Text("Important Task")
            .font(.headline)
        FavoriteIcon()
    }
    .padding()
}
 
