//
//  CurrentWeatherView.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//

import SwiftUI

struct CurrentWeatherView: View {
    let weather: CurrentWeather
    
    var body: some View {
        VStack(spacing: 8) {
            Text(weather.location)
                .whiteText(size: 36)
            
            Text("\(weather.temperature)°")
                .whiteText(size: 96, weight: .thin)
            
            Text(weather.condition)
                .whiteText(size: 22, weight: .medium)
            
            HStack(spacing: 12) {
                HStack(spacing: 4) {
                    Text("H:")
                        .whiteText(size: 18, weight: .medium)
                    Text("\(weather.high)°")
                        .whiteText(size: 18, weight: .semibold)
                }
                
                HStack(spacing: 4) {
                    Text("L:")
                        .whiteText(size: 18, weight: .medium)
                    Text("\(weather.low)°")
                        .whiteText(size: 18, weight: .semibold)
                }
            }
        }
    }
}

#Preview {
    ZStack {
        WeatherBackground()
        CurrentWeatherView(weather: .mock)
    }
    .ignoresSafeArea()
}
