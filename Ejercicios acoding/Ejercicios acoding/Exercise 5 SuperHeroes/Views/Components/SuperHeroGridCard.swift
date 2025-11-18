//
//  SuperHeroGridCard.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//

import SwiftUI

struct SuperHeroGridCard: View {
    let hero: SuperHero
    
    var body: some View {
        VStack {
            Image(hero.imagen)
                .heroCardImage()
            
            HeroCardText(nickname: hero.apodo, realName: hero.nombreReal)
        }
        .frame(width: SuperHeroStyles.Sizes.cardWidth)
    }
}

#Preview {
    SuperHeroGridCard(hero: SUPERHEROES.first!)
}
