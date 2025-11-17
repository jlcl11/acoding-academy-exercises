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
                .font(.system(size: 36, weight: .regular))
                .foregroundStyle(.white)
            
            Text("\(weather.temperature)°")
                .font(.system(size: 96, weight: .thin))
                .foregroundStyle(.white)
            
            Text(weather.condition)
                .font(.system(size: 22, weight: .medium))
                .foregroundStyle(.white)
            
            HStack(spacing: 12) {
                HStack(spacing: 4) {
                    Text("H:")
                        .font(.system(size: 18, weight: .medium))
                    Text("\(weather.high)°")
                        .font(.system(size: 18, weight: .semibold))
                }
                
                HStack(spacing: 4) {
                    Text("L:")
                        .font(.system(size: 18, weight: .medium))
                    Text("\(weather.low)°")
                        .font(.system(size: 18, weight: .semibold))
                }
            }
            .foregroundStyle(.white)
        }
    }
}
