//
//  HeroContent.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//

import SwiftUI

struct HeroContent: View {
    let hero: SuperHero
    
    var body: some View {
        VStack(alignment: .leading, spacing: SuperHeroStyles.Spacing.large) {
            if !hero.descripcion.isEmpty {
                StorySection(description: hero.descripcion)
            }
            
            PowersSection(powers: hero.poderes)
        }
        .padding(SuperHeroStyles.Spacing.large)
    }
}
