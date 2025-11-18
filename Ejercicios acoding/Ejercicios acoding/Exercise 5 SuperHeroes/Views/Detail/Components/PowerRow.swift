//
//  PowerRow.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//


import SwiftUI

struct PowerRow: View {
    let power: PoderesSuperheroes
    
    var body: some View {
        HStack(spacing: SuperHeroStyles.Spacing.medium) {
            PowerIcon(iconName: SuperHeroDetailView.powerIcons[power.rawValue] ?? "star.fill")
            
            Text(power.rawValue)
                .font(.headline)
                .foregroundColor(.primary)
            
            Spacer()
        }
        .cardBackground()
    }
}
