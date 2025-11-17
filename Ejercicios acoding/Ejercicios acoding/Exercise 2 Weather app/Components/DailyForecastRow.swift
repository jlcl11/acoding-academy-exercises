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
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.white)
                .frame(width: 50, alignment: .leading)
            
            Image(systemName: forecast.icon)
                .font(.system(size: 20))
                .foregroundStyle(.yellow)
                .symbolRenderingMode(.palette)
                .frame(width: 30)
            
            Text("\(forecast.low)°")
                .font(.system(size: 18))
                .foregroundStyle(.white.opacity(0.7))
                .frame(width: 35, alignment: .trailing)
            
            TemperatureBar(low: forecast.low, high: forecast.high)
            
            Text("\(forecast.high)°")
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.white)
                .frame(width: 35, alignment: .leading)
        }
        .padding(.horizontal, Constants.cardHorizontalPadding)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(forecast.day): High \(forecast.high) degrees, Low \(forecast.low) degrees")
    }
}
