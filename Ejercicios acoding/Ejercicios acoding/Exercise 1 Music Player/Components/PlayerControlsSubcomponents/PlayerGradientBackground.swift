//
//  PlayerGradientBackground.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 14/11/25.
//

import SwiftUI

struct PlayerGradientBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 28 / 255, green: 25 / 255, blue: 19 / 255),
                Color(red: 0.85, green: 0.82, blue: 0.75),
                Color(red: 0.58, green: 0.60, blue: 0.62),
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
}
