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
                .whiteText(size: 15, weight: .medium)
            
            Image(systemName: forecast.icon)
                .weatherIcon()
            
            Text("\(forecast.temp)°")
                .whiteText(size: 18, weight: .medium)
        }
    }
}

#Preview {
    ZStack {
        WeatherBackground()
        HStack(spacing: 20) {
            HourlyWeatherView(forecast: HourlyForecast(  
                time: "Now",
                icon: "sun.max.fill",
                temp: 22
            ))
            
            HourlyWeatherView(forecast: HourlyForecast(
                time: "15:00",
                icon: "cloud.sun.fill",
                temp: 24
            ))
            
            HourlyWeatherView(forecast: HourlyForecast(
                time: "16:00",
                icon: "cloud.fill",
                temp: 23
            ))
        }
        .padding()
    }
    .ignoresSafeArea()
}
