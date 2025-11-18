//
//  PowerIcon.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//


import SwiftUI

struct PowerIcon: View {
    let iconName: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(SuperHeroStyles.Colors.powerIconGradient)
                .frame(width: SuperHeroStyles.Sizes.powerIconSize, height: SuperHeroStyles.Sizes.powerIconSize)
            
            Image(systemName: iconName)
                .powerIconImage()
        }
    }
}
