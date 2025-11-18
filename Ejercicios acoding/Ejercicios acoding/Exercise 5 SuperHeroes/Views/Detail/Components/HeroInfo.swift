//
//  HeroInfo.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//

import SwiftUI

struct HeroInfo: View {
    let hero: SuperHero
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: SuperHeroStyles.Spacing.small) {
                Text(hero.apodo)
                    .heroTitleStyle()
                
                Text(hero.nombreReal)
                    .heroSubtitleStyle()
            }
            
            Spacer()
            
            AgeBadge(age: hero.edad)
        }
        .padding(.horizontal, SuperHeroStyles.Spacing.large)
        .padding(.bottom, SuperHeroStyles.Spacing.large)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
    }
}
