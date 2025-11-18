//
//  HeroHeaderImage.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//

import SwiftUI

struct HeroHeaderImage: View {
    let hero: SuperHero
    let dismiss: DismissAction
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(hero.imagen)
                .heroHeaderImage()
            
            SuperHeroStyles.Colors.imageGradient
            
            BackButton(dismiss: dismiss)
            
            HeroInfo(hero: hero)
        }
        .frame(height: SuperHeroStyles.Sizes.heroImageHeight)
    }
}
 //TODO: Preview
