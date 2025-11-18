//
//  SuperHeroGrid.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//

import SwiftUI

struct SuperHeroGridView: View {
    let columns = [
        GridItem(.adaptive(minimum: SuperHeroStyles.Sizes.cardWidth))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(SUPERHEROES) { hero in
                    NavigationLink(destination: SuperHeroDetailView(hero: hero)) {
                        SuperHeroGridCard(hero: hero)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
        }
        .navigationTitle("Superheroes")
    }
}
 
#Preview("Grid View") {
    NavigationStack {
        SuperHeroGridView()
    }
}

 
