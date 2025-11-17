//
//  WeatherBackground.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//

import SwiftUI

struct WeatherBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 0.714, green: 0.769, blue: 0.831),
                Color(red: 0.349, green: 0.537, blue: 0.725),
                Color(red: 0.259, green: 0.529, blue: 0.800)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
