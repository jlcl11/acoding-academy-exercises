//
//  PowersSection.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//

import SwiftUI

struct PowersSection: View {
    let powers: [PoderesSuperheroes]
    
    var body: some View {
        VStack(alignment: .leading, spacing: SuperHeroStyles.Spacing.medium) {
            Label("Superpowers", systemImage: "bolt.fill")
                .sectionTitleStyle()
            
            VStack(spacing: 12) {
                ForEach(powers, id: \.self) { power in
                    PowerRow(power: power)
                }
            }
        }
    }
}
