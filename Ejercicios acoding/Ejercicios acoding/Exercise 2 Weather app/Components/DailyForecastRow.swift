//
//  DailyForecastRow.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//

import SwiftUI

struct DailyForecastRow: View {
    let forecast: DailyForecast
    
    var body: some View {
        HStack(spacing: 12) {
            Text(forecast.day)
                .whiteText(size: 18, weight: .medium)
                .frame(width: 50, alignment: .leading)
            
            Image(systemName: forecast.icon)
                .weatherIcon(size: 20)
                .symbolRenderingMode(.palette)
                .frame(width: 30)
            
            Text("\(forecast.low)°")
                .whiteText(size: 18)
                .opacity(0.7)
                .frame(width: 35, alignment: .trailing)
            
            TemperatureBar(low: forecast.low, high: forecast.high)
            
            Text("\(forecast.high)°")
                .whiteText(size: 18, weight: .medium)
                .frame(width: 35, alignment: .leading)
        }
        .padding(.horizontal, Constants.cardHorizontalPadding)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(forecast.day): High \(forecast.high) degrees, Low \(forecast.low) degrees")
    }
}

#Preview {
    ZStack {
        WeatherBackground()
        VStack(spacing: 16) {
            DailyForecastRow(forecast: DailyForecast(
                day: "Today",
                icon: "sun.max.fill",
                low: 18,
                high: 28
            ))
            
            DailyForecastRow(forecast: DailyForecast(
                day: "Mon",
                icon: "cloud.sun.fill",
                low: 16,
                high: 24
            ))
            
            DailyForecastRow(forecast: DailyForecast(
                day: "Tue",
                icon: "cloud.rain.fill",
                low: 14,
                high: 20
            ))
        }
        .padding()
    }
    .ignoresSafeArea()
}
