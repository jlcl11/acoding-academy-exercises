//
//  HourlyWeatherView.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//

import SwiftUI

struct HourlyWeatherView: View {
    let forecast: HourlyForecast
    
    var body: some View {
        VStack(spacing: 8) {
            Text(forecast.time)
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(.white)
            
            Image(systemName: forecast.icon)
                .font(.system(size: 24))
                .foregroundStyle(.yellow)
                .symbolRenderingMode(.hierarchical)
            
            Text("\(forecast.temp)°")
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}
